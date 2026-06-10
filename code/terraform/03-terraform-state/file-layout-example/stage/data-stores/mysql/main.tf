terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {

    # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
    # manually, uncomment and fill in the config below.

    region         = "us-west-2"
    bucket         = "fctc-e7d358b"
    key            = "bingo/terraform.tfstate"
    dynamodb_table = "fctc-e7d358b"
    encrypt        = true

  }
}

provider "aws" {
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running-"
  engine              = "mysql"
  engine_version      = "8.4"
  allocated_storage   = 10
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true

  db_name = var.db_name

  username = var.db_username
  password = var.db_password
}
