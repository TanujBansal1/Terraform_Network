locals {
  vpc_name = "$(var.resource_prefix)-vpc"
  igw_name = "$(var.resource_prefix)-igw"
  rt_name  = "$(var.resource_prefix)-rt"
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = local.vpc_name
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name = "$(var.resource_prefix)-subnet-public-$(each.key)"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = local.igw_name
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = local.rt_name
  }
}

resource "aws_route_table_association" "routes" {
  for_each = aws_subnet.public

  route_table_id = aws_route_table.public_rt.id
  subnet_id      = each.value.id

}