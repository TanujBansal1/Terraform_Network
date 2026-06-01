output "load_balancer_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = aws_lb.this.dns_name
}

output "launch_template_id" {
  description = "The ID of the launch template."
  value       = aws_launch_template.this.id
}

output "autoscaling_group_name" {
  description = "The name of the Auto Scaling group."
  value       = aws_autoscaling_group.this.name
}