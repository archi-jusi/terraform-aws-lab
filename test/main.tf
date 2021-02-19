terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "prod_instance" {
  source            = "../modules/instance/"
  count = 3
  ami_id            = var.ami
  userdata          = file("deploywebserver.sh")
  tagsmap  = var.tagsmaptest
  securitygroup = [module.security.securitygroupid]
  
  depends_on = [
    module.security
    ]
}


module "security" {
  source            = "../modules/security/"
}


output "ec2-type" {
  description = "test condition"
  value       = "image: %{if var.ami == "ami-0fc970315c2d38f01"} linux %{else} windows %{endif}"
}
