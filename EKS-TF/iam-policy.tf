# resource "aws_iam_role_policy" "iam-policy-eks" {
#   name   = var.iam-policy-eks
#   role   = aws_iam_role.iam-role-eks.id
#   policy = file("${path.module}/iam-policy-eks.json")
# }

# resource "aws_iam_role_policy" "iam-policy-node" {
#   name   = var.iam-policy-node
#   role   = aws_iam_role.iam-role-node.id
#   policy = file("${path.module}/iam-policy-node.json")
# }

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.EKSClusterRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.NodeGroupRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.NodeGroupRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.NodeGroupRole.name
}