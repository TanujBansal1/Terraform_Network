resource "aws_iam_policy" "custom_policy" {
  name        = var.policy_name
  description = "Custom IAM policy managed by Terraform"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowS3Read"
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:ListBucket"]
        Resource = "*"
      }
    ]
  })
}