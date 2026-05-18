data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  filter {
    name   = "cidr-block"
    values = ["10.0.1.0/24", "10.0.3.0/24"]
  }
}

data "aws_security_group" "ec2_sg" {
  filter {
    name   = "tag:Name"
    values = [var.ec2_sg_name]
  }
  vpc_id = data.aws_vpc.selected.id
}

data "aws_security_group" "http_sg" {
  filter {
    name   = "tag:Name"
    values = [var.http_sg_name]
  }
  vpc_id = data.aws_vpc.selected.id
}

data "aws_security_group" "lb_sg" {
  filter {
    name   = "tag:Name"
    values = [var.lb_sg_name]
  }
  vpc_id = data.aws_vpc.selected.id
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}