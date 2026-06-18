output "address" {
  value       = module.mysql.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = module.mysql.port
  description = "The port the database is listening on"
}

output "ssm_prefix" {
  value       = module.mysql.ssm_prefix
  description = "The SSM parameter path prefix where DB credentials are stored"
}
