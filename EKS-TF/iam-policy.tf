resource "aws_iam_role_policy_attachment" "iam-policy-eks" {
  role       = aws_iam_role.iam-role-eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "iam-policy-AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.iam-role-ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "iam-policy-eks-AmazonEKS_CNI_Policy" {
  role       = aws_iam_role.iam-role-ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "iam-policy-eks-AmazonEC2ContainerRegistryReadOnly" {
  role       = aws_iam_role.iam-role-ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
