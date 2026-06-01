variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling group and load balancer."
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC for the target group."
  type        = string
}

variable "ssh_security_group_id" {
  description = "The ID of the SSH security group."
  type        = string
}

variable "private_http_sg_id" {
  description = "The ID of the private HTTP security group."
  type        = string
}

variable "public_http_sg_id" {
  description = "The ID of the public HTTP security group."
  type        = string
}

variable "aws_launch_template_name" {
  description = "Name of the launch template."
  type        = string
}

variable "aws_asg_name" {
  description = "Name of the Auto Scaling group."
  type        = string
}

variable "load_balancer" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the launch template."
  type        = string
}

variable "ssh_security_group_name" {
  description = "Name of the SSH security group (for display in user data)."
  type        = string
}

variable "private_http_sg_name" {
  description = "Name of the private HTTP security group (for display in user data)."
  type        = string
}