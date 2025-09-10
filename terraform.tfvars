# AWS Region
aws_region = "us-east-1"

# Cluster
cluster_name = "satyam-eks"
cluster_version = "1.28"

# VPC
vpc_cidr = "10.0.0.0/16"

# Public Subnets (for NAT / optional bastion)
public_subnets_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

# Private Subnets (for EKS nodes)
private_subnets_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24",
  "10.0.13.0/24"
]

# Availability Zones
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Node Group
node_group_desired = 3
node_group_min = 1
node_group_max = 5
node_group_instance_types = ["t3.medium", "t3.large"]

