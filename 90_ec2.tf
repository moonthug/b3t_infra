resource "aws_instance" "reverse_proxy" {
  ami = var.reverse_proxy_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.public_proxy.id]
  key_name = aws_key_pair.reverse_proxy_keypair.id

  connection {
    user = var.reverse_proxy_ssh_user
    private_key = var.reverse_proxy_keypair_private_path
  }
}

// Sends the public key to the instance
resource "aws_key_pair" "reverse_proxy_keypair" {
  key_name = "reverse_proxy_keypair"
  public_key = file(var.reverse_proxy_keypair_public_path)
}
