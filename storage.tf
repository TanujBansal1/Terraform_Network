resource "aws_s3_bucket" "bucket_storage" {
  bucket = var.s3_bucket_name

  tags = merge(
    var.common_tags,
    {
      Name = var.s3_bucket_name
    }
  )
}

resource "aws_s3_bucket_public_access_block" "Restrict_Access" {
  bucket = aws_s3_bucket.bucket_storage.id

  block_public_policy     = true
  block_public_acls       = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "Ownership_controls" {
  bucket = aws_s3_bucket.bucket_storage.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}