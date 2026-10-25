terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = var.project_name
      Student   = "Luong Tuan Manh"
      ManagedBy = "Terraform"
    }
  }
}

# Tim VPC mac dinh trong Region da chon
data "aws_vpc" "default" {
  default = true
}

# Lay cac subnet thuoc VPC mac dinh
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Lay AMI Amazon Linux 2023 phu hop voi Region
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# Security group rieng, khong mo cong inbound
resource "aws_security_group" "lab" {
  name_prefix = "${var.project_name}-"
  description = "Security group for Terraform Lab 3"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "${var.project_name}-sg"
  }
}

# Tao may ao EC2
resource "aws_instance" "lab" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = var.instance_type

  subnet_id = sort(data.aws_subnets.default.ids)[0]

  vpc_security_group_ids = [
    aws_security_group.lab.id
  ]

  associate_public_ip_address = false

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "${var.project_name}-ec2"
  }
}

# AWS tu them hau to de tao ten bucket duy nhat
resource "aws_s3_bucket" "lab" {
  bucket_prefix = "${var.project_name}-"

  tags = {
    Name = "${var.project_name}-s3"
  }
}

# Chan truy cap cong khai den bucket
resource "aws_s3_bucket_public_access_block" "lab" {
  bucket = aws_s3_bucket.lab.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}