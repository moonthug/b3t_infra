output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "public_web_sg" {
  value = aws_security_group.public_web.id
}
