data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "subnet1" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet1_name]
  }
}

data "aws_subnet" "subnet2" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet2_name]
  }
}

data "aws_security_group" "ssh_sg" {
  filter {
    name   = "tag:Name"
    values = [var.ssh_sg_name]
  }
}

data "aws_security_group" "http_sg" {
  filter {
    name   = "tag:Name"
    values = [var.http_sg_name]
  }
}

data "aws_security_group" "lb_sg" {
  filter {
    name   = "tag:Name"
    values = [var.lb_sg_name]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}