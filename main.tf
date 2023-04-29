terraform {
  backend "s3" {
    bucket = "my-dev-tf-state-bucket11"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region    = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  
  instance_tenancy = "default"
  
  enable_dns_support = true
  
  enable_dns_hostnames = true
  
  enable_classiclink = false
  
  enable_classiclink_dns_support = false
  
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "main"
  }
}


output "vpc_id" {
  value = vpc_id.main.id
  description = "VPC id."
  sensitive = false
}
