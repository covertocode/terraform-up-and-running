variable "cluster_name" {
  description = "The name to use to namespace all the resources in the cluster"
  type        = string
  default     = "webservers-stage"
}

variable "environment" {
  description = "The environment name (e.g. stage, prod)"
  type        = string
  default     = "stage"
}

variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "example_database"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
  default     = "example_user"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
  default     = "example_password"
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
