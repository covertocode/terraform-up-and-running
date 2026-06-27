# Combined module

This module deploys a complete web application stack by composing two child modules:

- **[modules/data-stores/mysql](../data-stores/mysql)** — provisions a MySQL RDS instance and publishes
  connection details (address, port, credentials) to AWS SSM Parameter Store.
- **[modules/services/webserver-cluster](../services/webserver-cluster)** — deploys an Auto Scaling Group
  of web servers behind an Application Load Balancer, reading DB connection info from SSM Parameter Store.

The `webserver_cluster` module's `db_ssm_prefix` is automatically wired to the `mysql` module's `ssm_prefix`
output, so no manual coordination is needed between the two layers.

## Quick start

Configure your AWS credentials:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

Configure database credentials:

```
export TF_VAR_db_username=(desired database username)
export TF_VAR_db_password=(desired database password)
```

Deploy the code:

```
terraform init
terraform apply
```

Test the load balancer:

```
curl http://$(terraform output -raw alb_dns_name)/
```

Clean up when you're done:

```
terraform destroy
```
