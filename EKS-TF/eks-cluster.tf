resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.iam-role-eks.arn
  vpc_config {
    subnet_ids = [data.aws_subnet.subnet.id,aws_subnet.public-subnet2.id]
  }

  depends_on = [aws_iam_role_policy_attachment.iam-policy-eks]
}