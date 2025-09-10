variable "cluster_name" {
  description = "Cluster or project name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of AZs (leave empty to auto-select first 2 available)"
  type        = list(string)
  default     = []
}
