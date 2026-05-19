variable "aws_region" {
  description = "Region of AWS resources"
  type        = string
}

variable "project_id" {
  description = "Common project id"
  type        = string
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of public subnet"
  type        = string
}

variable "security_group_name" {
  description = "Name of security group"
  type        = string
}

variable "ec2_instance_name" {
  description = "Name of ec2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}
