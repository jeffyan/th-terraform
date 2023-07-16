terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7.0"
    }
  }

  required_version = ">= 1.5.2"
}

provider "aws" {
  region = var.aws_region
}

module "dev_bucket" {
  source      = "./modules/dev_bucket"
  bucket_name = var.bucket_name
  access_type = var.access_type
  tags        = var.tags
}
