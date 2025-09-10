# AWS Region
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# Cluster
variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type    = string
  default = "1.28"
}

# VPC
variable "vpc_cidr" {
  type = string
}

variable "public_subnets_cidrs" {
  type = list(string)
}

variable "private_subnets_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type    = list(string)
  default = []
}

# Node Group
variable "node_group_desired" {
  type    = number
  default = 2
}

variable "node_group_min" {
  type    = number
  default = 1
}

variable "node_group_max" {
  type    = number
  default = 3
}

variable "node_group_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}
