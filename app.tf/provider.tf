provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "ptdbucket"
    key            = "eks/dev/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}
