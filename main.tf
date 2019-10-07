provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.assign_ipv6_block
  tags                             = var.tags
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Default Security Group"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.main.id
  tags   = var.tags
}

// condition ? true_val : false_val