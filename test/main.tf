provider "aws" {
  region = "eu-west-1"
}

module "prod_instance" {
  source = "../modules/instance/"
  ami_id = "ami-0fc970315c2d38f01"
  userdata = file("deploywebserver.sh")
  securitygroupname = "securityhttp"
}
