output "public_subnet_id_0" {
  value = aws_subnet.public[0].id
}

output "public_web_sg" {
  value = aws_security_group.public_web.id
}
