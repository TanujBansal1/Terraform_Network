resource "aws_launch_template" "this" {
  name          = var.launch_template_name
  image_id      = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  iam_instance_profile {
    name = var.instance_profile_name
  }

  network_interfaces {
    delete_on_termination = true
    security_groups = [
      data.aws_security_group.ec2_sg.id,
      data.aws_security_group.http_sg.id
    ]
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  user_data = base64encode(file("${path.module}/user_data.sh"))

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.common_tags,
      {
        Name = "${var.project_id}-instance"
      }
    )
  }

  tags = merge(
    var.common_tags,
    {
      Name = var.launch_template_name
    }
  )
}


resource "aws_lb" "this" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.lb_sg.id]
  subnets            = data.aws_subnets.public.ids

  tags = merge(
    var.common_tags, {
      Name = var.load_balancer_name
    }
  )
}

resource "aws_lb_target_group" "this" {
  name        = var.target_group_name
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.selected.id

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = merge(
    var.common_tags, {
      Name = var.target_group_name
    }
  )
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.load_balancer_name}-listener"
    }
  )
}

resource "aws_autoscaling_group" "this" {
  name                = var.asg_name
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
  desired_capacity    = var.asg_desired_size
  vpc_zone_identifier = data.aws_subnets.public.ids

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 60

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }

  tag {
    key                 = "Name"
    value               = var.asg_name
    propagate_at_launch = true
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project_id
    propagate_at_launch = true
  }


}

resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn    = aws_lb_target_group.this.arn

}
