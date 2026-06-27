output "db_address" {
  value       = module.mysql.address
  description = "Connect to the database at this endpoint"
}

output "db_port" {
  value       = module.mysql.port
  description = "The port the database is listening on"
}

output "db_ssm_prefix" {
  value       = module.mysql.ssm_prefix
  description = "The SSM parameter path prefix where DB credentials are stored"
}

output "alb_dns_name" {
  value       = module.webserver_cluster.alb_dns_name
  description = "The domain name of the load balancer"
}

output "asg_name" {
  value       = module.webserver_cluster.asg_name
  description = "The name of the Auto Scaling Group"
}

output "alb_security_group_id" {
  value       = module.webserver_cluster.alb_security_group_id
  description = "The ID of the Security Group attached to the load balancer"
}
