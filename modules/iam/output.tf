output "eks_cluster_role_arn" {
  description = "IAM role ARN for the EKS cluster"
  value       = aws_iam_role.eks_cluster.arn
}

output "node_group_role_arn" {
  description = "IAM role ARN for the EKS node group"
  value       = aws_iam_role.node_group.arn
}

output "eks_cluster_role_name" {
  description = "IAM role name for the EKS cluster"
  value       = aws_iam_role.eks_cluster.name
}

output "node_group_role_name" {
  description = "IAM role name for the node group"
  value       = aws_iam_role.node_group.name
}
