# Create the VPC
resource "aws_vpc" "main" {
  cidr_block        = var.main_vpc_cidr
  instance_tenancy  = "default"
  tags              = merge(local.tags, {"Name"="${var.namespace}-vpc"})
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "gateway" {
  vpc_id =  aws_vpc.main.id
  tags   = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-igw"})
}
