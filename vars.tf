# -----------------------------------------------------------------------------
# Variables: General
# -----------------------------------------------------------------------------

variable "environment" {
  description = "Environment to use"
  default = "dev"
}

# -----------------------------------------------------------------------------
# Variables: AWS
# -----------------------------------------------------------------------------


variable "namespace" {
  description = "AWS resource namespace/prefix"
}

variable "region" {
  description = "AWS Region"
}

variable "profile" {
  description = "AWS Profile to use"
}

# -----------------------------------------------------------------------------
# Variables: VPC
# -----------------------------------------------------------------------------

variable "main_vpc_cidr" {
  description = "Main VPC CIDR"
}

variable "public_subnets" {
  description = "Public subnet CIDR"
}

variable "private_subnets" {
  description = "Private subnet CIDR"
}

# -----------------------------------------------------------------------------
# Variables: Locals
# -----------------------------------------------------------------------------

locals {
  tags = {
    "namespace": var.namespace
  }
}
