output "vpc_id" {
  description = "The ID of the created VPC."
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the created subnets."
  value       = module.network.subnet_ids
}

output "ssh_security_group_id" {
  description = "The ID of the SSH security group."
  value       = module.network_security.ssh_security_group_id
}

output "public_http_security_group_id" {
  description = "The ID of the public HTTP security group."
  value       = module.network_security.public_http_security_group_id
}

output "private_http_security_group_id" {
  description = "The ID of the private HTTP security group."
  value       = module.network_security.private_http_security_group_id
}

output "load_balancer_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = module.application.load_balancer_dns_name
}