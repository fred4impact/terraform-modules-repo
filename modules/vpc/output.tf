output "region" {
  description = "The region in which the VPC will be created"
  value       = var.region
}


output "project_name" {
  description = "The name of the project"
  value       = var.project_name
}

output "enviroment_name" {
  description = "The name of the environment"
  value       = var.enviroment_name
  
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
  
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
  
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public_subnets[*].id
  
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private_subnets[*].id
  
}

output "public_route_table" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_route_table.id
  
}

output "private_route_table" {
  description = "The ID of the private route table"
  value       = aws_route_table.private_route_table.id
  
}


