provider "aws" {
  region = "eu-west-3"
}

module "prod_instance" {
  source = "../modules/instance/"
  ami_id = "ami-032e5b6af8a711f30"
}
