# modules/security-group/variables.tf

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the security group will be created"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block for allowing access to control plane"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the security group"
}
