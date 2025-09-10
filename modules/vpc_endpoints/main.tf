# S3 Gateway Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.route_table_ids

  tags = {
    Name = "${var.cluster_name}-s3-endpoint"
  }
}

# List of interface endpoints
locals {
  interface_endpoints = [
    "ecr.api",
    "ecr.dkr",
    "sts",
    "logs",
    "ec2"
  ]
}

# Security group for endpoints
resource "aws_security_group" "endpoints_sg" {
  name        = "${var.cluster_name}-endpoints-sg"
  description = "Security group for interface endpoints"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}-endpoints-sg"
  }
}

# Interface endpoints
resource "aws_vpc_endpoint" "interface_endpoints" {
  for_each            = toset(local.interface_endpoints)
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.${each.key}"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.private_subnet_ids
  security_group_ids  = [aws_security_group.endpoints_sg.id]
  private_dns_enabled = true

  tags = {
    Name = "${var.cluster_name}-${each.key}-endpoint"
  }
}


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
# VPC Endpoint Module
# -----------------------------
module "vpc_endpoints" {
  source             = "./modules/vpc_endpoint"
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  vpc_cidr           = var.vpc_cidr
  aws_region         = var.aws_region
  private_subnet_ids = module.vpc.private_subnet_ids

  # both public + private route tables required for S3 Gateway endpoint
  route_table_ids = [
    module.vpc.public_route_table_id,
    module.vpc.private_route_table_id
  ]
}

# -----------------------------
# Outputs
# -----------------------------
output "s3_endpoint_id" {
  value       = module.vpc_endpoints.s3_endpoint_id
  description = "ID of the created S3 Gateway Endpoint"
}

output "interface_endpoints" {
  value       = module.vpc_endpoints.interface_endpoints
  description = "Map of interface endpoint names to IDs"
}
