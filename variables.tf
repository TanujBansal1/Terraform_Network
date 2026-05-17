variable "aws_region" {
  description = "AWS Region "
  type        = string
}

variable "resource_prefix" {
  description = "Prefix values for resource"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR range for VPC"
  type        = string
}

variable "public_subnets" {
  description = "Map of Public Subnets, their AZ and CIDR"
  type = map(object({
    az         = string
    cidr_block = string
    suffix     = string
  }))
}