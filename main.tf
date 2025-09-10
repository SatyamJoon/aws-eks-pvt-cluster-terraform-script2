

##############################
# VPC Module
##############################
module "vpc" {
  source               = "./modules/vpc"
  cluster_name         = var.cluster_name
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidrs = var.public_subnets_cidrs
  private_subnets_cidrs= var.private_subnets_cidrs
  availability_zones   = var.availability_zones
}

##############################
# IAM Module
##############################
module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
  tags         = { Name = var.cluster_name }
}

##############################
# Security Group for Worker Nodes
##############################
module "worker_sg" {
  source       = "./modules/security-group"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = var.vpc_cidr
  tags         = { Name = var.cluster_name }
}

##############################
# VPC Endpoints
##############################
module "vpc_endpoints" {
  source              = "./modules/vpc-endpoints"
  cluster_name        = var.cluster_name
  vpc_id              = module.vpc.vpc_id
  vpc_cidr            = var.vpc_cidr
  private_subnet_ids  = module.vpc.private_subnet_ids
  route_table_ids = [
    module.vpc.route_table_private_id,
    module.vpc.route_table_public_id
  ]
  aws_region          = var.aws_region
}

##############################
# EKS Module
##############################
module "eks" {
  source = "./modules/eks"

  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version
  cluster_role_arn          = module.iam.eks_cluster_role_arn
  cluster_role_attachments  = module.iam.eks_cluster_role_attachments
  node_group_role_arn       = module.iam.node_group_role_arn
  private_subnet_ids        = module.vpc.private_subnet_ids
  node_group_desired        = var.node_group_desired
  node_group_min            = var.node_group_min
  node_group_max            = var.node_group_max
  node_group_instance_types = var.node_group_instance_types
  tags                      = { Name = var.cluster_name }
  aws_region                = var.aws_region
}



