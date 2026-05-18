output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

output "instance_subnet_id" {
  description = "Subnet ID where the instance was launched (from remote state)"
  value       = aws_instance.ec2_instance.subnet_id
}

output "remote_state_vpc_id" {
  description = "VPC ID read from the remote state"
  value       = data.terraform_remote_state.base_infra.outputs.vpc_id
}