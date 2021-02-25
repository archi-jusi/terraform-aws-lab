terraform { 
  required_providers {
    aws = {
       source = "hashicorp/aws"
       version = "~> 3.29.1"
   }
}
} 


provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "s3_terraform_state_test" {
  bucket = "terraform-state-test-devopshandsonlad"
  
/*  lifecycle { 
    prevent_destroy = true
  }*/

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule{
         apply_server_side_encryption_by_default {
         sse_algorithm = "AES256"
       }
    }
  } 
}

resource "aws_dynamodb_table" "db_terraform_state_test"{
  name = "terraform-state-test-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute{
    name = "LockID"
    type = "S"
  }
}
