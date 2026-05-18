aws_region = "eu-west-1"

vpc_name = "cmtr-sghaq6oo-01-vpc"
vpc_cidr = "10.10.0.0/16"

internet_gateway_name = "cmtr-sghaq6oo-01-igw"
route_table_name      = "cmtr-sghaq6oo-01-rt"

public_subnets = {
  "subnet-1" = {
    name       = "cmtr-sghaq6oo-01-subnet-public-a"
    az         = "eu-west-1a"
    cidr_block = "10.10.1.0/24"
  },
  "subnet-2" = {
    name       = "cmtr-sghaq6oo-01-subnet-public-b"
    az         = "eu-west-1b"
    cidr_block = "10.10.3.0/24"
  },
  "subnet-3" = {
    name       = "cmtr-sghaq6oo-01-subnet-public-c"
    az         = "eu-west-1c"
    cidr_block = "10.10.5.0/24"
  }
}

