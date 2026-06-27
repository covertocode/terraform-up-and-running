terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "mysql" {
  source = "../data-stores/mysql"

  db_name        = var.db_name
  db_username    = var.db_username
  db_password    = var.db_password
  environment    = var.environment
  instance_class = var.db_instance_class
}

module "webserver_cluster" {
  source = "../services/webserver-cluster"

  cluster_name  = var.cluster_name
  db_ssm_prefix = module.mysql.ssm_prefix
  instance_type = var.instance_type
  min_size      = var.min_size
  max_size      = var.max_size
  server_port   = var.server_port

  depends_on = [module.mysql]
}
