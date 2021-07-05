# -----------------------------------------------------------------------------
# Variables: General
# -----------------------------------------------------------------------------

variable "namespace" {
  description = "Namespace and AWS prefix"
  default = "b3t"
}

variable "environment" {
  description = "Environment to use"
}

variable "domain" {
  description = "Main domain"
}

# -----------------------------------------------------------------------------
# Variables: AWS
# -----------------------------------------------------------------------------

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

variable "availability_zone_suffixes" {
  description = "List of availability zone suffixes (e.g. a, b c => eu-west-1a)"
  type        = list(string)
  default     = [
    "a",
    "b",
    "c",
  ]
}

# -----------------------------------------------------------------------------
# Variables: Cognito
# -----------------------------------------------------------------------------

variable "cognito_create_users" {
  description = "List of cognito users to create"
  type        = list(string)
  default     = [
    "a",
    "b",
    "c",
  ]
}

# -----------------------------------------------------------------------------
# Variables: DB
# -----------------------------------------------------------------------------

variable "doc_db_master_username" {
  description = "DocumentDB Cluster master username"
}

variable "doc_db_master_password" {
  description = "DocumentDB Cluster master username"
}

# -----------------------------------------------------------------------------
# Variables: Reverse Proxy
# -----------------------------------------------------------------------------

variable "reverse_proxy_ami" {
  description = "AWS Image to use for Reverse Proxy instance"
  default = "ami-0ac43988dfd31ab9a"
}

variable "reverse_proxy_ssh_user" {
  description = "SSH User"
  default = "ec2-user"
}

variable "reverse_proxy_keypair_public_path" {
  description = "Public key path"
  default = "keys/b3t_reverse_proxy.pub"
}

variable "reverse_proxy_keypair_private_path" {
  description = "Private key path"
  default = "keys/b3t_reverse_proxy"
}

# -----------------------------------------------------------------------------
# Variables: Cognito
# -----------------------------------------------------------------------------

variable "admin_password" {
  description = "Cognito Admin password"
}


# -----------------------------------------------------------------------------
# Variables: Locals
# -----------------------------------------------------------------------------

locals {
  tags = {
    "namespace": var.namespace
    "environment": var.environment
  }
}
