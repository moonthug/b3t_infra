# Create public web SG
resource "aws_security_group" "public_web" {
  name    = "${var.namespace}-${var.environment}-public-web"
  vpc_id  = aws_vpc.main.id
  tags    = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-public-web"})

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_docdb" {
  name    = "${var.namespace}-${var.environment}-private-docdb"
  vpc_id  = aws_vpc.main.id
  tags    = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-private-docdb"})

  ingress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "public_proxy" {
  name    = "${var.namespace}-${var.environment}-proxy"
  vpc_id  = aws_vpc.main.id
  tags    = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-public-proxy"})

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
