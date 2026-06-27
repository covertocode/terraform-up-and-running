terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {}

module "combined" {
  source        = "../../modules/combined"
  cluster_name  = var.cluster_name
  environment   = var.environment
  db_name       = var.db_name
  db_username   = var.db_username
  db_password   = var.db_password
  instance_type = var.instance_type
  min_size      = var.min_size
  max_size      = var.max_size
}
