variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "environment" {
  description = "The environment name (e.g. stage, prod). Used as prefix for SSM parameter paths."
  type        = string
}

variable "db_name" {
  description = "The name to use for the database"
  type        = string
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t3.micro)"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
  default     = 2
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}
