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

resource "aws_instance" "this" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  tags = {
    Name = var.tag_name
  }
}
