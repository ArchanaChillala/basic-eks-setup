resource "aws_eks_cluster" "bootcamp" {
  name     = "bootcamp-cluster"
  role_arn = aws_iam_role.bootcamp_eks.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.bootcamp_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.bootcamp_AmazonEKSVPCResourceController,
  ]
}


resource "aws_eks_node_group" "bootcamp" {
  cluster_name    = aws_eks_cluster.bootcamp.name
  node_group_name = "bootcamp-node-group"
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.bootcamp_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.bootcamp_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.bootcamp_AmazonEC2ContainerRegistryReadOnly,
  ]
}