output "ssh_security_group_id" {
  description = "ID of the SSH security group"
  value       = aws_security_group.ssh_security_group.id
}

output "public_http_security_group_id" {
  description = "ID of the public HTTP security group"
  value       = aws_security_group.public_http.id
}

output "private_http_security_group_id" {
  description = "ID of the private HTTP security group"
  value       = aws_security_group.private_http.id
}

output "public_instance_public_ip" {
  description = "Public IP address of the public EC2 instance"
  value       = data.aws_instance.public_instance.public_ip
}

output "private_instance_private_ip" {
  description = "Private IP address of the private EC2 instance"
  value       = data.aws_instance.private_instance.private_ip
}