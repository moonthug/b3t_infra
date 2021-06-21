# Create public web SG
resource "aws_security_group" "public_web" {
  name    = "${var.namespace}-${var.environment}-public-web"
  vpc_id  = aws_vpc.main.id
  tags    = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-private-subnet"})

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
