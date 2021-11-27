output "endpoint" {
  value = aws_eks_cluster.bootcamp.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.bootcamp.certificate_authority[0].data
}