# Create a Public Subnets.
resource "aws_subnet" "public" {
  count                     = length(var.public_subnets_cidr)

  vpc_id                    = aws_vpc.main.id
  cidr_block                = var.public_subnets_cidr[count.index]
  map_public_ip_on_launch   = "true"
  tags                      = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-public-subnet"})
}

# Route table for Public Subnets
resource "aws_route_table" "public" {
  vpc_id =  aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
}
