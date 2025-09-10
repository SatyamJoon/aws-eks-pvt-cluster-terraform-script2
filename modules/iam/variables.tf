# modules/iam/variables.tf

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to IAM roles"
}
