output "address" {
  value       = aws_db_instance.example.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = aws_db_instance.example.port
  description = "The port the database is listening on"
}

output "ssm_prefix" {
  value       = "/${var.environment}/data-stores/mysql"
  description = "The SSM parameter path prefix where DB credentials are stored"
}
