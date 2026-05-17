output "Bucket_id" {
  description = "Id of S3 bucket"
  value       = aws_s3_bucket.bucket_storage.id
}

output "bucket_arn" {
  description = "ARN of S3 bucket"
  value       = aws_s3_bucket.bucket_storage.arn
}

output "bucket_region" {
  description = "Region in which bucket is placed"
  value       = aws_s3_bucket.bucket_storage.region
}

output "bucket_domain_name" {
  description = "Domain name of Bucket"
  value       = aws_s3_bucket.bucket_storage.bucket_domain_name
}