variable "vpc_id" {
  description = "The ID of the VPC where the security groups are created."
  type        = string
}

variable "allowed_ip_range" {
  description = "List of allowed CIDR ranges for SSH and HTTP ingress."
  type        = list(string)
}

variable "ssh_security_group_name" {
  description = "Name of the SSH security group."
  type        = string
}

variable "public_http_security_group_name" {
  description = "Name of the public HTTP security group."
  type        = string
}

variable "private_http_security_group_name" {
  description = "Name of the private HTTP security group."
  type        = string
}