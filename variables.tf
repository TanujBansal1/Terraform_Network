variable "aws_region" {
  type        = string
  description = "Region for resources"
}

variable "blue_weight" {
  type        = number
  description = "Weight of blue deployment"
}

variable "green_weight" {
  type        = number
  description = "Weight of green deployment"
}

variable "vpc_name" {
  type        = string
  description = "Name of VPC"
}

variable "public_subnet1_name" {
  type        = string
  description = "Name of public subnet1"
}

variable "public_subnet2_name" {
  type        = string
  description = "Name of public subnet2"
}

variable "ssh_sg_name" {
  type        = string
  description = "Name of SSH Security Group"
}

variable "http_sg_name" {
  type        = string
  description = "Name of HTTP Security Group"
}

variable "instance_type" {
  type        = string
  description = "Type of instance"
}

variable "resource_prefix" {
  type        = string
  description = "Prefix of resource name"
}

variable "asg_min_size" {
  type        = number
  description = "ASG min size"
}

variable "asg_max_size" {
  type        = number
  description = "ASG max size"
}

variable "asg_desired_capacity" {
  type        = number
  description = "ASG desired capacity"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}
