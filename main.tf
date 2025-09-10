# -----------------------------
# VPC Module
# -----------------------------
module "vpc" {
  source                = "./modules/vpc"
  cluster_name          = var.cluster_name
  vpc_cidr              = var.vpc_cidr
  public_subnets_cidrs  = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
  availability_zones    = var.availability_zones
}

# -----------------------------
# IAM Module (roles for EKS & Nodes)
# -----------------------------
module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
}

# -----------------------------
# Security Group Module (for workers)
# -----------------------------
module "security_groups" {
  source       = "./modules/security-groups"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = var.vpc_cidr
}

# -----------------------------
# EKS Module
# -----------------------------
module "eks" {
  source = "./modules/eks"

  cluster_name               = var.cluster_name
  cluster_version            = var.cluster_version
  aws_region                 = var.aws_region
  private_subnet_ids         = module.vpc.private_subnet_ids
  cluster_role_arn_eks       = module.iam.eks_cluster_role_arn    
  node_group_role_arn        = module.iam.eks_node_group_role_arn
  node_group_desired         = var.node_group_desired
  node_group_min             = var.node_group_min
  node_group_max             = var.node_group_max
  node_group_instance_types  = var.node_group_instance_types

  cluster_dependencies = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSServicePolicy
  ]
}


# -----------------------------
# VPC Endpoint Module
# -----------------------------
module "vpc_endpoints" {
  source             = "./modules/vpc_endpoint"
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  vpc_cidr           = var.vpc_cidr
  aws_region         = var.aws_region
  private_subnet_ids = module.vpc.private_subnet_ids
  route_table_ids    = concat(
    [module.vpc.public_route_table_id],
    [module.vpc.private_route_table_id]
  )
}

# -----------------------------
# Outputs
# -----------------------------
output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_node_group_arn" {
  value = module.eks.node_group_arn
}

output "workers_sg_id" {
  value = module.security_groups.worker_sg_id
}

output "s3_endpoint_id" {
  value = module.vpc_endpoints.s3_endpoint_id
}

output "interface_endpoints" {
  value = module.vpc_endpoints.interface_endpoints
}
