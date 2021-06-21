resource "aws_ssm_parameter" "private_subnet_id" {
  name        = "/${var.namespace}/${var.environment}/private_subnet_id"
  type        = "String"
  value       = aws_subnet.private.id
}

resource "aws_ssm_parameter" "public_subnet_id" {
  name        = "/${var.namespace}/${var.environment}/public_subnet_id"
  type        = "StringSet"
  value       = aws_subnet.public.id
}

resource "aws_ssm_parameter" "public_web_sg" {
  name        = "/${var.namespace}/${var.environment}/public_web_sg"
  type        = "String"
  provider    = ""
  value       = aws_security_group.public_web.id
}
