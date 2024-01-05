resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = var.eksnode-group-name
  node_role_arn   = aws_iam_role.iam-role-ec2.arn
  subnet_ids      = [data.aws_subnet.subnet.id, aws_subnet.public-subnet2.id]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  instance_types = ["t2.medium"]

  depends_on = [
    aws_iam_role_policy_attachment.iam-policy-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.iam-policy-eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.iam-policy-eks-AmazonEC2ContainerRegistryReadOnly
  ]
}