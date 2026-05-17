output "iam_group_name" {
  description = "IAM group name"
  value       = aws_iam_group.group.name
}

output "iam_group_arn" {
  description = "IAM Group ARN"
  value       = aws_iam_group.group.arn
}

output "iam_policy_name" {
  description = "IAM policy name"
  value       = aws_iam_policy.name.name
}

output "iam_policy_arn" {
  description = "IAM Policy ARN"
  value       = aws_iam_policy.name.arn
}

output "iam_role_name" {
  description = "Name of the created IAM role"
  value       = aws_iam_role.iam_role.name
}

output "iam_role_arn" {
  description = "ARN of the created IAM role"
  value       = aws_iam_role.iam_role.arn
}

output "iam_instance_profile_name" {
  description = "Name of the created IAM instance profile"
  value       = aws_iam_instance_profile.name.name
}

output "iam_instance_profile_arn" {
  description = "ARN of the created IAM instance profile"
  value       = aws_iam_instance_profile.name.arn
}