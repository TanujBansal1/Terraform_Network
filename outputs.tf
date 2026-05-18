output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "vpc_cidr" {
  description = "CIDR block of VPC"
  value       = aws_vpc.vpc.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of all public subnets"
  value       = [for s in aws_subnet.public_subnets : s.id]
}

output "public_subnet_cidr_block" {
  description = "CIDR blocks of public subnets"
  value       = [for s in aws_subnet.public_subnets : s.cidr_block]
}

output "public_subnet_availability_zone" {
  description = "AZ of public subnets"
  value       = [for s in aws_subnet.public_subnets : s.availability_zone]
}

output "internet_gateway_id" {
  description = "Internet gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "routing_table_id" {
  description = "Routing Table ID"
  value       = aws_route_table.route_table.id
}
