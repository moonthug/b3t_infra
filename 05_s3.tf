# Create bucket for frontend
resource "aws_s3_bucket" "web" {
  bucket  = var.domain
  acl     = "public-read"
  policy  = templatefile("templates/s3_website_policy.tpl", { BUCKET_NAME = var.domain })
  tags    = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-s3"})

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
