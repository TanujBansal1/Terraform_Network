variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "s3_bucket_name" {
  description = "Bucket name"
  type        = string
}

variable "common_tags" {
  description = "common tags"
  type        = map(string)
}