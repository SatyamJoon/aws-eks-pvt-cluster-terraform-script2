variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the SG will be created"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block of the VPC (for control plane access)"
}
