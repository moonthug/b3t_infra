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
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  description = "Public subnet CIDR"
  type        = list(string)
  default     = [
    "10.0.0.0/24",
    "10.0.1.0/24"
//    "10.0.2.0/24"
  ]
}

variable "private_subnets_cidr" {
  description = "Private subnet CIDR"
  type        = list(string)
  default     = [
    "10.0.10.0/24",
    "10.0.11.0/24"
//    "10.0.12.0/24"
  ]
}

# -----------------------------------------------------------------------------
# Variables: Locals
# -----------------------------------------------------------------------------

locals {
  tags = {
    "namespace": var.namespace
  }
}
