terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  alias = "london"
  region = "eu-west-2"
} 

provider "aws" {
  alias = "paris"
  region = "eu-west-3"
}
