variable "aws_region" {
  description = "Region of Resources"
  type        = string
}

variable "project_id" {
  description = "Common project id"
  type        = string
}

variable "state_bucket" {
  description = "Remote bucket url"
  type        = string
}

variable "state_key" {
  description = "Path to the state file in bucket"
  type        = string
}

variable "ami_id" {
  description = "AMI id for ec2 instance image"
  type        = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}

