provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}
locals {
 rendered_tags = {
    "Project"     = "${var.tags["Project"]}"
    "Namespace"   = "${var.tags["Namespace"]}"
    "Environment" = "${var.tags["Environment"]}"
    "Stage"       = "${var.tags["Stage"]}"
    "Team"        = "${var.tags["Team"]}"
    "Owner"       = "${var.tags["Owner"]}"  
  }
}

resource "aws_vpc" "main" {
  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.assign_ipv6_block
  tags = merge( {
    "Name"  = "${var.tags["Project"]}-${var.tags["Environment"]}-${var.tags["Stage"]}-VPC" ,
    "Description" = "${var.tags["Project"]} VPC"}, local.rendered_tags 
    )
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id
   tags = merge( {
    "Name"  = "${var.tags["Project"]}-${var.tags["Environment"]}-${var.tags["Stage"]}-VPC-SecurityGroup" ,
    "Description" = "${var.tags["Project"]} VPC: Default Security Group"}, 
    local.rendered_tags)
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.main.id
   tags = merge( {
    "Name"  = "${var.tags["Project"]}-${var.tags["Environment"]}-${var.tags["Stage"]}-InternetGategay" ,
    "Description" = "${var.tags["Project"]} VPC default Internet Gateway"}, 
    local.rendered_tags)
}

// condition ? true_val : false_val