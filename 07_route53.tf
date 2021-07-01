# Get the correct zone information from domain
data "aws_route53_zone" "main" {
  name         = var.domain
  private_zone = false
}

# Create Web Domain
resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = data.aws_route53_zone.main.name
  type    = "A"

  alias {
    name                   = aws_s3_bucket.web.website_domain
    zone_id                = aws_s3_bucket.web.hosted_zone_id
    evaluate_target_health = "false"
  }
}











