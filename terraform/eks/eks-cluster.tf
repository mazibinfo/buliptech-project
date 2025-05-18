module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.4.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.28"

  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium"]
  }

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
    }
  }

  tags = {
    Environment = "dev"
  }
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = module.eks.cluster_name
}

