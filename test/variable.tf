# variable for ec2

variable "ami" {
  description = "ami for testing environment - london"
  default     = "ami-0fc970315c2d38f01"
}

variable "tagsmaptest" {
  description = "name for the instance"
  type        = map(any)
  default = {
    Env       = "Test",
    Owner     = "infra",
    Team      = "devops"
    Name      = null
    Terraform = true
  }
}

variable "securityname" {
  description = "name for security group - has to be unique"
  type        = string
  default     = "httponly"
}

locals {
  tag_test = {
    env   = "test"
    owner = "terraform"
  }
}
