variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_id" {
  description = "Project ID common for all resources"
  type        = string
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}

variable "key_pair_name" {
  description = "Name of Key Pair required for SSH access"
  type        = string
}

variable "instance_profile_name" {
  description = "Name of instance profile for EC2"
  type        = string
}

variable "ec2_sg_name" {
  description = "Name of SG allowing SSH to EC2"
  type        = string
}

variable "http_sg_name" {
  description = "Name of SG allowing HTTP from load balancer"
  type        = string
}

variable "lb_sg_name" {
  description = "Name of SG allowing HTTP to load balancer"
  type        = string
}

variable "launch_template_name" {
  description = "Name of instance launch template"
  type        = string
}

variable "asg_name" {
  description = "Name of Auto Scaling Group"
  type        = string
}

variable "load_balancer_name" {
  description = "Name of load balancer"
  type        = string
}

variable "target_group_name" {
  description = "Name of target group of load balancer"
  type        = string
}

variable "asg_min_size" {
  description = "Size of min resources in ASG"
  type        = number
}

variable "asg_max_size" {
  description = "Size of max resources in ASG"
  type        = number
}

variable "asg_desired_size" {
  description = "Size of desired number of resources in ASG"
  type        = number
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}