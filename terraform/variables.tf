variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "my-eks-cluster"
}

variable "db_name" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}

