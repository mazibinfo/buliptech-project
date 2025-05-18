terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "AWS_PROFILE"
}

module "vpc" {
  source = "./vpc"
}

module "eks" {
  source       = "./eks"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnets
  cluster_name = var.cluster_name
}

module "rds" {
  source          = "./rds"
  db_name         = var.db_name
  db_username     = var.db_username
  db_password     = var.db_password
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  security_groups = [module.vpc.db_sg_id]
}

