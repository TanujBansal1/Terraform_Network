data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_instance" "public_instance" {
  instance_id = var.public_instance_id
}

data "aws_instance" "private_instance" {
  instance_id = var.private_instance_id
}

resource "aws_security_group" "ssh_security_group" {
  name        = var.ssh_security_group_name
  description = "SSH Security group"
  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags, {
      Name = var.ssh_security_group_name
    }
  )
}

resource "aws_security_group_rule" "ssh_ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  security_group_id = aws_security_group.ssh_security_group.id
  protocol          = "tcp"
  description       = "Allow SSH traffic from allowed IP"
  cidr_blocks       = var.allowed_ip_range
}

resource "aws_security_group_rule" "ssh_ingress_icmp" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  description       = "Allow ICMP traffic from allowed IP"
  cidr_blocks       = var.allowed_ip_range
  security_group_id = aws_security_group.ssh_security_group.id
}


resource "aws_security_group" "public_http" {
  vpc_id      = var.vpc_id
  name        = var.public_http_security_group_name
  description = "Allow HTTP and ICMP from Allowed IP"

  tags = merge(
    var.common_tags,
    {
      Name = var.public_http_security_group_name
    }
  )
}

resource "aws_security_group_rule" "public_http_ingress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.public_http.id
  description       = "Allow HTTP traffic from Allowed IP"
  cidr_blocks       = var.allowed_ip_range
}

resource "aws_security_group_rule" "public_http_ingress_icmp" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  security_group_id = aws_security_group.public_http.id
  description       = "Allow ICMP traffic from Allowed IP"
  cidr_blocks       = var.allowed_ip_range
}

resource "aws_security_group" "private_http" {
  name        = var.private_http_security_group_name
  vpc_id      = var.vpc_id
  description = "Allow HTTP and ICMP from public security group"

  tags = merge(
    var.common_tags,
    {
      Name = var.private_http_security_group_name
    }
  )
}

resource "aws_security_group_rule" "private_http_ingress_http" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  security_group_id        = aws_security_group.private_http.id
  description              = "Allow HTTP from Public SG"
  source_security_group_id = aws_security_group.public_http.id
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "private_http_ingress_icmp" {
  type                     = "ingress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "icmp"
  security_group_id        = aws_security_group.private_http.id
  source_security_group_id = aws_security_group.public_http.id
  description              = "Allow ICMP from Public SG"
}

resource "aws_network_interface_sg_attachment" "public_ssh" {
  security_group_id    = aws_security_group.ssh_security_group.id
  network_interface_id = data.aws_instance.public_instance.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_ssh" {
  security_group_id    = aws_security_group.ssh_security_group.id
  network_interface_id = data.aws_instance.private_instance.network_interface_id
}

resource "aws_network_interface_sg_attachment" "public_http" {
  security_group_id    = aws_security_group.public_http.id
  network_interface_id = data.aws_instance.public_instance.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_http" {
  security_group_id    = aws_security_group.private_http.id
  network_interface_id = data.aws_instance.private_instance.network_interface_id
}


