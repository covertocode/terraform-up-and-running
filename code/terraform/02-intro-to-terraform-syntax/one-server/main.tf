terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {}


data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_iam_role" "ssm" {
  path = "/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm" {
  path = "/"
  role = aws_iam_role.ssm.name
}

resource "aws_instance" "app" {
  instance_type        = "t2.micro"
  ami                  = data.aws_ssm_parameter.al2023_ami.value
  iam_instance_profile = aws_iam_instance_profile.ssm.name

  user_data = <<-EOF
              #!/bin/bash
              systemctl enable amazon-ssm-agent
              systemctl start amazon-ssm-agent
              EOF

  tags = {
    Name = "terraform-example"
  }
}
