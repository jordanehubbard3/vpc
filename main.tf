terraform {
  backend "s3" {
    bucket = "my-dev-tf-state-bucket11"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region    = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_classiclink_dns_support = false
  assign_generated_ipv6_cidr_block = false
  

  tags = {
    Name = "main"
  }
}
