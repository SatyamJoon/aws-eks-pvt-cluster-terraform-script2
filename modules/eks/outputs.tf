output "cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "EKS cluster endpoint (private)"
}

output "cluster_certificate_authority_data" {
  value       = aws_eks_cluster.this.certificate_authority[0].data
  description = "Certificate authority data"
}

output "cluster_security_group_id" {
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
  description = "Cluster security group ID"
}

output "node_group_arn" {
  value       = aws_eks_node_group.managed_nodes.arn
  description = "ARN of the managed node group"
}
