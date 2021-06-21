# Create a Private Subnet
resource "aws_subnet" "private" {
  vpc_id      = aws_vpc.main.id
  cidr_block  = var.private_subnets
  tags        = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-private-subnet"})
}

# Route table for Private Subnets
resource "aws_route_table" "private" {
  vpc_id  = aws_vpc.main.id
  tags    = merge(local.tags, {"Name"="${var.namespace}-${var.environment}"})

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.gw.id
  }
}

# Route table Association with Private Subnets
resource "aws_route_table_association" "private" {
  subnet_id       = aws_subnet.private.id
  route_table_id  = aws_route_table.private.id
}

resource "aws_eip" "private" {
  vpc = true
}

# Create the NAT Gateway for the Private Subnets
resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.private.id
  subnet_id     = aws_subnet.private.id
  tags          = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-gw"})
}
