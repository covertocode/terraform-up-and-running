resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = var.instance_class
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}

resource "aws_ssm_parameter" "db_address" {
  name  = "/${var.environment}/data-stores/mysql/address"
  type  = "String"
  value = aws_db_instance.example.address
}

resource "aws_ssm_parameter" "db_port" {
  name  = "/${var.environment}/data-stores/mysql/port"
  type  = "String"
  value = tostring(aws_db_instance.example.port)
}

resource "aws_ssm_parameter" "db_username" {
  name  = "/${var.environment}/data-stores/mysql/username"
  type  = "SecureString"
  value = var.db_username
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/${var.environment}/data-stores/mysql/password"
  type  = "SecureString"
  value = var.db_password
}
