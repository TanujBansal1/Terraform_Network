output "vpc_id" {
  description = "The Id of created VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of VPC"
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_id" {
  description = "The Ids of Public Subnets"
  value       = { for k, s in aws_subnet.public : k => s.id }
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_rt.id
}