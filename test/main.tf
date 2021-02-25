terraform {
  required_version = "~>0.14.6"
  backend "s3" {
    bucket = "terraform-state-test-devopshandsonlad"
    key    = "test/terraform.state"
    region = "eu-west-1"

    dynamodb_table = "terraform-state-test-lock"
    encrypt        = true
  }

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

data "template_file" "user_data" {
  template = file("../script/deploywebserver.sh")
}

module "prod_instance" {
  source = "../modules/instance/"
  #for_each = toset(["ami-0fc970315c2d38f01","ami-022e8cc8f0d3c52fd"])
  for_each = {
    #ami-0fc970315c2d38f01 = "Linux Ami"
    ami-022e8cc8f0d3c52fd = "Ubuntu Ami"
  }


  ami_id = each.key

  userdata = data.template_file.user_data.rendered 

  #tagsmap  = var.tagsmaptest


  tagsmap = {
    Name = each.value
    #Name        = each.key
    Team        = var.tagsmaptest["Team"]
    Environment = var.tagsmaptest["Env"]
    Terraform   = true
  }

  securitygroup = [module.security.securitygroupid]

  depends_on = [
    module.security
  ]
}


module "security" {
  source            = "../modules/security/"
  securitygroupname = var.securityname
  in_cidr_block     = ["5.170.0.0/16"]

}


output "ec2-type" {
  description = "test condition"
  value       = "image: %{if var.ami == "ami-0fc970315c2d38f01"} AWS linux 2 Ireland %{else} other %{endif}"
}

