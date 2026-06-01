output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "The IDs of all created subnets."
  value       = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
}