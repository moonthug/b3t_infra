resource "aws_s3_bucket" "web" {
  bucket  = "b3t-web"
  acl     = "public-read"
  policy  = templatefile("templates/s3_website_policy.tpl", { BUCKET_NAME = "b3t-web" })
  tags    = merge(local.tags, {"Name"="${var.namespace}-${var.environment}-s3"})

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
