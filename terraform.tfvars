 
# General / Cluster

cluster_name    = "satyam-eks-cluster"
aws_region      = "us-east-1"
cluster_version = "1.29"

# VPC
vpc_cidr = "10.0.0.0/16"

public_subnets_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones    = ["us-east-1a", "us-east-1b"]

# Node Group
node_group_desired        = 2
node_group_min            = 1
node_group_max            = 3
node_group_instance_types = ["t3.medium"]
