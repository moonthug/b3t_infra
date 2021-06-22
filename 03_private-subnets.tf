# Create Private Subnet for AZ-A

module "private_subnet_0" {
  source           = "./modules/private-subnet"

  namespace         = var.namespace
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_cidr[0]
  availability_zone = "${var.region}${var.availability_zone_suffixes[0]}"
  subnet_count      = "0"
  public_subnet_id  = aws_subnet.public[0].id
  tags              = local.tags
  gateway_id        = aws_internet_gateway.gateway.id
}

module "private_subnet_1" {
  source           = "./modules/private-subnet"

  namespace         = var.namespace
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_cidr[1]
  availability_zone = "${var.region}${var.availability_zone_suffixes[1]}"
  subnet_count      = "1"
  public_subnet_id  = aws_subnet.public[1].id
  tags              = local.tags
  gateway_id        = aws_internet_gateway.gateway.id
}

//module "private_subnet_2" {
//  source           = "./modules/private-subnet"
//
//  namespace         = var.namespace
//  vpc_id            = aws_vpc.main.id
//  cidr_block        = var.private_subnets_cidr[2]
//  availability_zone = "${var.region}${var.availability_zone_suffixes[2]}"
//  subnet_count      = "2"
//  public_subnet_id  = aws_subnet.public[1].id
//  tags              = local.tags
//  gateway_id        = aws_internet_gateway.gateway.id
//}
