terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.23.1"
    }
    
    ansible = {
      source = "ansible/ansible"
      version = "1.3.0"
    }
  }
  
  backend "s3" {
    bucket = "AWS_BUCKET_INSTANCE_INPUT"
    key = "state/terraform.tfstate"
    region = "AWS_REGION_INPUT"
  }
}

provider "ansible" {}


