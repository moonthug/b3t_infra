resource "aws_docdb_subnet_group" "main" {
  subnet_ids = [
    module.private_subnet_0.id,
    module.private_subnet_1.id
  ]
}

resource "aws_docdb_cluster" "main" {
  cluster_identifier      = "${var.namespace}-${var.environment}-cluster"
  master_username         = var.doc_db_master_username
  master_password         = var.doc_db_master_password
  db_subnet_group_name    = aws_docdb_subnet_group.main.name
  vpc_security_group_ids  = [
    aws_security_group.private_docdb.id
  ]
  tags                    = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-docdb-cluster"})
}

resource "aws_docdb_cluster_instance" "instance_0" {
  auto_minor_version_upgrade  = true
  cluster_identifier          = aws_docdb_cluster.main.id
  instance_class              = "db.t3.medium"
  identifier                  = "${var.namespace}-${var.environment}-instance-0"
  tags                        = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-docdb-instance-0"})
}

