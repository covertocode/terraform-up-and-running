# terraform-up-and-running

Code from Season 5, reading "Terraform: Up and Running", by Jim Brikman.

Content for the repo was seeded from ["Terraform: Up & Running" by Yevgeniy Brikman, 3rd edition](https://github.com/brikis98/terraform-up-and-running-code/tree/3rd-edition)

## Modernization and updates

### `code/terraform/04-terraform-module/module-example`

- Replaced deprecated aws_launch_configuration with aws_launch_template in the webserver-cluster module — uses dynamic Ubuntu 24.04 AMI lookup, base64encode() for user_data, and adds IAM instance profile for SSM access

- Replaced terraform_remote_state with SSM Parameter Store for passing DB connection info to the webserver cluster; eliminates cross-stack S3 state coupling in favor of runtime SSM parameter lookups with scoped IAM permissions

- Extracted a reusable modules/data-stores/mysql module that provisions the RDS instance and publishes connection details (address, port, credentials) to SSM Parameter Store, keyed by environment

- Upgraded RDS instance class from db.t2.micro to db.t3.micro to resolve InvalidParameterCombination error with MySQL 8.4

- Updated user-data script to install and enable SSM agent and busybox via apt on Ubuntu 24.04


