output "key_pair_name" {
  description = "Key pair name"
  value       = aws_key_pair.name.key_name
}

output "instance_id" {
  description = "Instance ID"
  value       = aws_instance.aws_instance.id
}

output "instance_public_ip" {
  description = "Public IP of instance"
  value       = aws_instance.aws_instance.public_ip
}

output "instance_public_dns" {
  description = "The public DNS name of instance"
  value       = aws_instance.aws_instance.public_dns
}

output "ssh_connection_command" {
  description = "SSH connection command"
  value       = "ssh -i ~/.ssh/id_rsa ec2-user@${aws_instance.aws_instance.public_ip}"
}