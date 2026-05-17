locals {
  instance_name = "${var.resource_prefix}-ec2"
}

data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }
}

data "aws_subnet" "public" {
  id = tolist(data.aws_subnets.subnets.ids)[0]
}

data "aws_security_group" "ssh" {
  filter {
    name   = "tag:Name"
    values = [var.security_group]
  }
  vpc_id = data.aws_vpc.selected_vpc.id
}

resource "aws_instance" "aws_instance" {
  ami                         = var.ami_id
  instance_type               = var.instane_type
  subnet_id                   = data.aws_subnet.public.id
  security_groups             = [data.aws_security_group.ssh.id]
  key_name                    = aws_key_pair.name.key_name
  associate_public_ip_address = true

  tags = merge(
    var.common_tags,
    {
      Name = local.instance_name
    }
  )
}

