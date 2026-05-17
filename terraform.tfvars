aws_region      = "eu-west-1"
resource_prefix = "cmtr-sghaq6oo-01"
vpc_cidr        = "10.10.0.0/16"

public_subnets = {
  "a" = {
    az         = "eu-west-1a"
    cidr_block = "10.10.1.0/24"
    suffix     = "a"
  }
  "b" = {
    az         = "eu-west-1b"
    cidr_block = "10.10.3.0/24"
    suffix     = "b"
  }
  "c" = {
    az         = "eu-west-1c"
    cidr_block = "10.10.5.0/24"
    suffix     = "c"
  }
}