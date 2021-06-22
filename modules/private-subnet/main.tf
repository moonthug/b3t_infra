# Create Private Sub-domain
resource "aws_subnet" "private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  tags              = merge(var.tags, {"Name"="${var.namespace}-${var.environment}-private-subnet-${var.subnet_count}"})
}

# Create Private Route Table
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
}

# Create Sub-domain/Route Table Association
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

# Create EIP for Private Sub-domain NAT Gateway
resource "aws_eip" "private" {
  vpc = true
}

# Create NAT Gateway for Private Sub-domain
resource "aws_nat_gateway" "gateway" {
  allocation_id = aws_eip.private.id
  subnet_id     = var.public_subnet_id
  tags          = merge(var.tags, {"Name"="${var.namespace}-${var.environment}-gw"})
}

# Create Route Egress Route
resource "aws_route" "route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.gateway.id
}
