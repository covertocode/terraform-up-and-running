# Web server cluster module

This folder contains a reusable [Terraform](https://www.terraform.io/) module for deploying a cluster of web servers
(using [EC2](https://aws.amazon.com/ec2/), [Launch Templates](https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html),
and [Auto Scaling](https://aws.amazon.com/autoscaling/)) with a load balancer (using
[ALB](https://aws.amazon.com/elasticloadbalancing/)) in an [Amazon Web Services (AWS) account](http://aws.amazon.com/).
The load balancer listens on port 80 and returns the text "Hello, World" for the `/` URL.

The module uses an `aws_launch_template` (replacing the deprecated `aws_launch_configuration`), dynamically looks up
the latest Ubuntu 24.04 AMI, and reads database connection info from
[AWS SSM Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html)
rather than `terraform_remote_state`. Instances are provisioned with an IAM instance profile for SSM Session Manager access.

For more info, please see Chapter 4, "How to Create Reusable Infrastructure with Terraform Modules", of
*[Terraform: Up and Running](http://www.terraformupandrunning.com)*.

## Quick start

Terraform modules are not meant to be deployed directly. Instead, you should be including them in other Terraform
configurations. See [stage/services/webserver-cluster](../../../stage/services/webserver-cluster) and
[prod/services/webserver-cluster](../../../prod/services/webserver-cluster) for examples.