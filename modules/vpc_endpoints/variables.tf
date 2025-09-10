variable "cluster_name" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "route_table_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}
