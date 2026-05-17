variable "aws_region" {
  description = "Region in which resources are to be created"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "policy_file" {
  description = "Policy file name"
  type        = string
}

variable "common_tag" {
  description = "Common tags for resources"
  type        = map(string)
}

variable "iam_group_name" {
  description = "IAM group name"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name"
  type        = string
}

variable "iam_policy_name" {
  description = "IAM Policy Name"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

