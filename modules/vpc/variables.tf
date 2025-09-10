# modules/vpc/variables.tf

variable "cluster_name" {
  type        = string
  description = "Name of the cluster / VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnets_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnets_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  default     = []
  description = "Optional AZs to use; if empty, first 2 AZs will be used"
}
