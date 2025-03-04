terraform {
  backend "s3" {
    bucket         = "eks-tfbackend"
    region         = "ap-south-1"
    key            = "End-to-End-Kubernetes-DevSecOps-Tetris-Project/eks-terraform/terraform.tfstate"
    dynamodb_table = "terrform-dynamodb-march"
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}
