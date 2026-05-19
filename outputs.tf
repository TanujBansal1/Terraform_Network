output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.this.public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.this.private_ip
}

output "discovered_vpc_id" {
  description = "VPC ID discovered via data source"
  value       = data.aws_vpc.selected.id
}

output "discovered_subnet_id" {
  description = "Public subnet ID discovered via data source"
  value       = data.aws_subnet.public_subnet.id
}

output "discovered_security_group_id" {
  description = "Security group ID discovered via data source"
  value       = data.aws_security_group.selected.id
}

output "discovered_ami_id" {
  description = "Amazon Linux 2023 AMI ID discovered via data source"
  value       = data.aws_ami.ami_id.id
}