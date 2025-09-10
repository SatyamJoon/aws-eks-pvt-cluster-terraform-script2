########################################
# EKS Cluster Variables
########################################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.30"
}

variable "aws_region" {
  description = "AWS region where the cluster will be created"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the EKS cluster and node groups"
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "IAM role ARN for the EKS control plane"
  type        = string
}

variable "node_group_role_arn" {
  description = "IAM role ARN for the EKS node group"
  type        = string
}

# This allows you to pass IAM policy attachments from IAM module
variable "cluster_role_policy_attachment" {
  description = "List of dependencies for EKS cluster role policies"
  type        = list(any)
  default     = []
}

########################################
# Node Group Variables
########################################

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
  description = "List of EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}
