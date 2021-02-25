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
  for_each = toset(["ami-0fc970315c2d38f01","ami-022e8cc8f0d3c52fd"])
  
  ami_id            = each.key
  userdata          = file("deploywebserver.sh")
  tagsmap  = var.tagsmaptest
  securitygroup = [module.security.securitygroupid]
  
  depends_on = [
    module.security
    ]
}


module "security" {
  source            = "../modules/security/"
  securitygroupname = "httponly"
  in_cidr_block = ["5.170.0.0/16"]
}


output "ec2-type" {
  description = "test condition"
  value       = "image: %{if var.ami == "ami-0fc970315c2d38f01"} AWS linux 2 Ireland %{else} other %{endif}"
}
