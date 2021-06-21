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

variable "vpc_id" {
  description = "ID of the VPC to attach subnet to"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet to inhabit"
  type        = string
}

//variable "availability_zone" {
//  description = "Availability zone for the subnet to inhabit"
//  type        = string
//}

//variable "name" {
//  description = "Name for the subnet resources to build upon"
//  type        = string
//}

variable "subnet_count" {
  description = "Number for the subnet resources to build upon"
  type        = string
}

variable "public_subnet_id" {
  description = "ID for public subnet (in same AZ) to add NAT Gateway too"
  type        = string
}

variable "tags" {
  description = "List of all available tags to attach to resources"
  type        = map
}

variable "gateway_id" {
  description = "Internet Gateway ID (used to cause hard resource dependency)"
  type        = string
}
