variable "aws_region" {
  description = "Region of resources"
  type        = string
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of VPC"
  type        = string
}

variable "public_subnets" {
  description = "Public Subnet Name, AZ and CIDR blocks"
  type = map(object({
    name       = string
    az         = string
    cidr_block = string
  }))
}

variable "internet_gateway_name" {
  description = "Name of internet gateway"
  type        = string
}

variable "route_table_name" {
  description = "Name of route table"
  type        = string
}
