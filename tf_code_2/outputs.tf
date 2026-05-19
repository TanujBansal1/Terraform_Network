output "policy_arn" {
  description = "ARN of custom policy"
  value       = aws_iam_policy.custom_policy.arn
}