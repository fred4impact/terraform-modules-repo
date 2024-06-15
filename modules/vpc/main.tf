# vpc reation
resource "aws_vpc" "vpc" {
  cidr_block =var.vpc_cidr 
  instance_tenancy = "default" 
  enable_dns_hostnames = true
  
  tags = {
    Name ="${var.project_name}-${var.enviroment_name}-vpc" 
  }
}

# internet gateway creation
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-${var.enviroment_name}-igw"
  }
  
}





# Declare the data source for availability zones
data "aws_availability_zones" "available" {}

# Public subnets creation
resource "aws_subnet" "public_subnets" {
  count               = length(var.public_subnets)
  vpc_id              = aws_vpc.vpc.id
  cidr_block          = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone   = element(data.aws_availability_zones.available.names, count.index)
  
  tags = {
    Name = "${var.project_name}-public-${count.index}"
  }
}

# Private subnets creation
resource "aws_subnet" "private_subnets" {
  count               = length(var.private_subnets)
  vpc_id              = aws_vpc.vpc.id
  cidr_block          = var.private_subnets[count.index]
  availability_zone   = element(data.aws_availability_zones.available.names, count.index)
  
  tags = {
    Name = "${var.project_name}-private-${count.index}"
  }
}



# Public route table creation
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-${var.enviroment_name}-public-route-table"
  }
  
}

# Public route table association
resource "aws_route_table_association" "public_subnets_association" {
  count = length(var.public_subnets)
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_route_table.id
  
}

# Private route table creation
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
 tags = {
   Name = "${var.project_name}-${var.enviroment_name}-private-route-table"
 }
}

resource "aws_route_table_association" "private_subnets_association" {
  count = length(var.private_subnets)
  subnet_id = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}


