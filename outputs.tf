output "load_balancer_dns" {
  description = "DNS name of the Application Load Balancer (open this in a browser)"
  value       = aws_lb.this.dns_name
}

output "load_balancer_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.this.arn
}

output "target_group_arn" {
  description = "ARN of the load balancer target group"
  value       = aws_lb_target_group.this.arn
}

output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.this.id
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.this.name
}

output "ami_id_used" {
  description = "AMI ID used by the launch template"
  value       = data.aws_ami.amazon_linux_2023.id
}