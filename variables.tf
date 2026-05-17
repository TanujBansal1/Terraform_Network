variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "resource_prefix" {
  description = "Prefix for resource name"
  type        = string
}

variable "vpc_name" {
  description = "Tag of pre created VPC"
  type        = string
}

variable "security_group" {
  description = "Tag of pre created security group"
  type        = string
}

variable "instane_type" {
  description = "EC2 instance type to launch"
  type        = string
}

variable "ami_id" {
  description = "AMI id for instance"
  type        = string
}

variable "ssh_key" {
  description = "Public SSH key "
  type        = string
}

variable "common_tags" {
  description = "Common tags for resources"
  type        = map(string)
}