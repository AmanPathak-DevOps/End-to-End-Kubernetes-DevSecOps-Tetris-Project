# resource "aws_iam_role" "iam-role-eks" {
#   name               = var.iam-role-eks
#   assume_role_policy = file("${path.module}/iam-role-eks.json")
# }

# resource "aws_iam_role" "iam-role-node" {
#   name               = var.iam-role-node
#   assume_role_policy = file("${path.module}/iam-role-node.json")
# }

resource "aws_iam_role" "EKSClusterRole" {
  name = "EKSClusterRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role" "NodeGroupRole" {
  name = "EKSNodeGroupRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}