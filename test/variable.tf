# variable for ec2

variable "ami" {
  description = "ami for testing environment - london"
  default     = "ami-0fc970315c2d38f01"
}

variable "tagsmaptest" {
  description = "name for the instance"
  type = map
  default = {
     env = "Test",
     owner = "infra",
     managed = "terraform",
     team = "devops"
   }
}

locals {
  tag_test = {
    env   = "test"
    owner = "terraform"
  }
}
