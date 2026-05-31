output "alb_dns_name" {
  description = "DNS name of Load Balancer"
  value = aws_lb.load_balancer.dns_name
}