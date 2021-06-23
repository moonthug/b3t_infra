# DocumentDB Master Username
resource "aws_secretsmanager_secret" "doc_db_master_username" {
  name = "/${var.namespace}/${var.environment}/doc_db_master_username"
}

resource "aws_secretsmanager_secret_version" "doc_db_master_username" {
  secret_id     = aws_secretsmanager_secret.doc_db_master_username.id
  secret_string = var.doc_db_master_username
}

# DocumentDB Master Password
resource "aws_secretsmanager_secret" "doc_db_master_password" {
  name = "/${var.namespace}/${var.environment}/doc_db_master_password"
}

resource "aws_secretsmanager_secret_version" "doc_db_master_password" {
  secret_id     = aws_secretsmanager_secret.doc_db_master_password.id
  secret_string = var.doc_db_master_password
}
