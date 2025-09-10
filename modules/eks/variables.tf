# modules/eks/variables.tf

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "EKS cluster version"
}

variable "cluster_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS cluster"
}

variable "cluster_role_attachments" {
  type        = list(any)
  description = "IAM role policy attachments for the cluster"
  default     = []
}

variable "node_group_role_arn" {
  type        = string
  description = "IAM role ARN for the node group"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for EKS cluster and node group"
}

variable "node_group_desired" {
  type        = number
  default     = 2
  description = "Desired number of nodes"
}

variable "node_group_min" {
  type        = number
  default     = 1
  description = "Minimum number of nodes"
}

variable "node_group_max" {
  type        = number
  default     = 3
  description = "Maximum number of nodes"
}

variable "node_group_instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "EC2 instance types for node group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the cluster"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}
