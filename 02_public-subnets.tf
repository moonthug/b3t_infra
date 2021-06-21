# Create the VPC
resource "aws_vpc" "main" {
  cidr_block       = var.main_vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name: "main"
  }
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "gateway" {
  vpc_id =  aws_vpc.main.id
}

# Create a Public Subnets.
resource "aws_subnet" "public" {
  vpc_id =  aws_vpc.main.id
  cidr_block = var.public_subnets
}

# Create a Private Subnet
resource "aws_subnet" "private" {
  vpc_id =  aws_vpc.main.id
  cidr_block = var.private_subnets
}

# Route table for Public Subnets
resource "aws_route_table" "public" {
  vpc_id =  aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
}

# Route table for Private Subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
}

# Route table Association with Public Subnet"s
resource "aws_route_table_association" "public_association" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Route table Association with Private Subnet"s
resource "aws_route_table_association" "private_association" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_eip" "nateIP" {
  vpc = true
}

# Creating the NAT Gateway using subnet_id and allocation_id
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nateIP.id
  subnet_id = aws_subnet.public.id
}
