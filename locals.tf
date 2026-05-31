locals {
  lb_name             = "${var.resource_prefix}-lb"
  blue_tg_name        = "${var.resource_prefix}-blue-tg"
  green_tg_name       = "${var.resource_prefix}-green-tg"
  blue_asg_name       = "${var.resource_prefix}-blue-asg"
  green_asg_name      = "${var.resource_prefix}-green-asg"
  blue_template_name  = "${var.resource_prefix}-blue-template"
  green_template_name = "${var.resource_prefix}-green-template"

  subnet_ids = [
    data.aws_subnet.subnet1.id,
    data.aws_subnet.subnet2.id
  ]

  blue_user_data = base64encode(<<-EOF
  #!/bin/bash
  yum update -y
  yum install httpd -y
  systemctl enable httpd
  systemctl start httpd
  echo "<h1>Blue Environment</h1>" > /var/www/html/index.html
  EOF
  )

  green_user_data = base64encode(<<-EOF
  #!/bin/bash
  yum update -y
  yum install httpd -y
  systemctl enable httpd
  systemctl start httpd
  echo "<h1>Green Environment</h1>" > /var/www/html/index.html
  EOF
  )

}