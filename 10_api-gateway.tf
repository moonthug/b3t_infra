resource "aws_iam_role_policy" "api_gateway_access" {
  name   = "api-gateway-access"
  role   = aws_iam_role.api_gateway_access.id
  policy = data.aws_iam_policy_document.api_gateway_access.json
}

resource "aws_iam_role" "api_gateway_access" {
  name = "ap-gateway-access"

  assume_role_policy = templatefile("templates/api_gateway_access_assume_role_policy.tpl", {
    IDENTITY_POOL_ID = aws_cognito_identity_pool.main.id
  })
}

data "aws_iam_policy_document" "api_gateway_access" {
  version = "2012-10-17"
  statement {
    actions = [
      "execute-api:Invoke"
    ]
    effect = "Allow"
    resources = ["arn:aws:execute-api:*:*:*"]
  }
}

resource "aws_iam_role_policy" "deny_everything" {
  name   = "deny_everything"
  role   = aws_iam_role.deny_everything.id
  policy = data.aws_iam_policy_document.deny_everything.json
}

resource "aws_iam_role" "deny_everything" {
  name = "deny_everything"

  assume_role_policy = templatefile("templates/deny_everything_assume_role_policy.tpl", {
    IDENTITY_POOL_ID = aws_cognito_identity_pool.main.id
  })
}

data "aws_iam_policy_document" "deny_everything" {
  version = "2012-10-17"

  statement {
    actions = ["*"]
    effect    = "Deny"
    resources = ["*"]
  }
}

# Matched Odds API Gateway
resource "aws_api_gateway_rest_api" "matched_odds" {
  name        = "${var.namespace}-${var.environment}-matched-odds"
  description = "Matched Odds API"
}
