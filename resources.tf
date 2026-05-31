resource "aws_lb" "load_balancer" {
  name               = local.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.lb_sg.id]
  subnets            = local.subnet_ids


  tags = merge(var.tags, {
    Name = local.lb_name
  })
}

resource "aws_lb_target_group" "blue" {
  name     = local.blue_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = merge(var.tags, {
    Name = local.blue_tg_name
  })
}

resource "aws_lb_target_group" "green" {
  name     = local.green_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id

  health_check {
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = merge(var.tags, {
    Name = local.green_tg_name
  })
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.blue.arn
        weight = var.blue_weight
      }

      target_group {
        arn    = aws_lb_target_group.green.arn
        weight = var.green_weight
      }

      stickiness {
        enabled  = false
        duration = 1
      }
    }
  }

  tags = merge(var.tags, {
    Name = "${var.resource_prefix}-http-listener"
  })
}

resource "aws_launch_template" "blue" {
  name          = local.blue_template_name
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  user_data     = local.blue_user_data

  vpc_security_group_ids = [
    data.aws_security_group.http_sg.id,
    data.aws_security_group.ssh_sg.id
  ]

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
      Name = "${var.resource_prefix}-blue-instance"
    })
  }

  tags = merge(var.tags, {
    Name = local.blue_template_name
  })
}

resource "aws_launch_template" "green" {
  name          = local.green_template_name
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  user_data     = local.green_user_data

  vpc_security_group_ids = [
    data.aws_security_group.http_sg.id,
    data.aws_security_group.ssh_sg.id
  ]

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
      Name = "${var.resource_prefix}-green-instance"
    })
  }

  tags = merge(var.tags, {
    Name = local.green_template_name
  })
}

resource "aws_autoscaling_group" "blue" {
  name                = local.blue_asg_name
  vpc_zone_identifier = local.subnet_ids
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
  desired_capacity    = var.asg_desired_capacity
  target_group_arns   = [aws_lb_target_group.blue.arn]
  health_check_type   = "EC2"

  launch_template {
    id      = aws_launch_template.blue.id
    version = "$Latest"
  }

  dynamic "tag" {
    for_each = merge(var.tags, { Name = local.blue_asg_name })
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_group" "green" {
  name                = local.green_asg_name
  vpc_zone_identifier = local.subnet_ids
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
  desired_capacity    = var.asg_desired_capacity
  target_group_arns   = [aws_lb_target_group.green.arn]
  health_check_type   = "EC2"

  launch_template {
    id      = aws_launch_template.green.id
    version = "$Latest"
  }

  dynamic "tag" {
    for_each = merge(var.tags, { Name = local.green_asg_name })
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

