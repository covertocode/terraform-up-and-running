variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "db_ssm_prefix" {
  description = "The SSM parameter path prefix where DB connection info is stored (e.g. /stage/data-stores/mysql)"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}
