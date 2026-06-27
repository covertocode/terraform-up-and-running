# Combined stack (staging environment)

This folder deploys the full web application stack for the staging environment using the
[combined module](../../modules/combined). It provisions both the MySQL database and the
webserver cluster in a single `terraform apply`.

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

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
