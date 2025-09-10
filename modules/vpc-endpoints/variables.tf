variable "cluster_name" {
  type        = string
  description = "Cluster name for tagging resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where endpoints will be created"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block for endpoint security group"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnets for interface endpoints"
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs for S3 Gateway endpoint"
}

variable "aws_region" {
  type        = string
  description = "AWS region for endpoints"
}
