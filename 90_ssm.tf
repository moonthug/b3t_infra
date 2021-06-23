resource "aws_ssm_parameter" "vpc_arn" {
  name        = "/${var.namespace}/${var.environment}/vpc_arn"
  type        = "String"
  value       = aws_vpc.main.arn
}

resource "aws_ssm_parameter" "private_subnet_id_0" {
  name        = "/${var.namespace}/${var.environment}/private_subnet_0"
  type        = "String"
  value       = module.private_subnet_0.id
}

resource "aws_ssm_parameter" "private_subnet_id_1" {
  name        = "/${var.namespace}/${var.environment}/private_subnet_1"
  type        = "String"
  value       = module.private_subnet_1.id
}

resource "aws_ssm_parameter" "public_subnet_id_0" {
  name        = "/${var.namespace}/${var.environment}/public_subnet_0"
  type        = "String"
  value       = aws_subnet.public[0].id
}

resource "aws_ssm_parameter" "public_subnet_id_1" {
  name        = "/${var.namespace}/${var.environment}/public_subnet_1"
  type        = "String"
  value       = aws_subnet.public[1].id
}

resource "aws_ssm_parameter" "public_web_sg" {
  name        = "/${var.namespace}/${var.environment}/public_web_sg"
  type        = "String"
  value       = aws_security_group.public_web.id
}

resource "aws_ssm_parameter" "doc_db_endpoint" {
  name        = "/${var.namespace}/${var.environment}/doc_db_endpoint"
  type        = "String"
  value       = aws_docdb_cluster.main.endpoint
}