variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "public_instance_id" {
  description = "Public Instance Id"
  type        = string
}

variable "private_instance_id" {
  description = "Private instance id"
  type        = string
}

variable "ssh_security_group_name" {
  description = "SSH Security Group name"
  type        = string
}

variable "public_http_security_group_name" {
  description = "Public security group name"
  type        = string
}

variable "private_http_security_group_name" {
  description = "Private security group name"
  type        = string
}

variable "allowed_ip_range" {
  description = "Allowed IP Ranges"
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}