# -----------------------------
# General / Cluster
# -----------------------------
variable "cluster_name" {
  description = "Name of the EKS cluster and prefix for resources"
  type        = string
  default     = "my-eks-cluster"
}

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.29"
}

# -----------------------------
# VPC
# -----------------------------
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones to use (leave empty to auto-select)"
  type        = list(string)
  default     = []
}

# -----------------------------
# Node Group
# -----------------------------
variable "node_group_desired" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_group_min" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_group_max" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "node_group_instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}
