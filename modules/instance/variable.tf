
# Variable global
##########################

variable "region" {
  description = "region for the provider and the AMI"
  default     = "eu-west-1"
}

# Variable for EC2 instance
##########################

data "aws_ami" "amazon-ami-linux2-mostrecent" {
  most_recent = true

 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }

 owners           = ["amazon"]


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }

}


variable "ami_id" {
  description = "id for AMI"
  type        = string
  default     = "ami-0fc970315c2d38f01"
  #validation {
    #condition = length(var.ami_id) > 4 && substr(var.ami_id, 0, 4) == "ami-"
    #error_message = "The ami is not valid, doesn't start with ami- !"	
#}
}
variable "instance_type" {
  description = "type of instance"
  type        = string
  default     = "t2.micro"
}

variable "tagenv" {
  description = "tag env"
  type        = string
  default     = "test"
}

variable "tagname" {
  description = "name for the instance"
  type        = string
  default     = "webserver"
}

variable "keyname" {
  description = "key pair name for the instance - already created on AWS"
  type        = string
  default     = "terraformkey"
}

variable "userdata" {
  description = "bootstrapping for ec2 - null by default"
  default = null
}

variable "name_ec2" {
  description = "Name for the Ec2 instance"
  default = null
}



variable "tagsmap" {
  description = "name for the instance" 
  type = map
  default = {
     env = "Test",
     owner = "jusi",
     managed = "terraform"
     Name = null
   }
}

variable "securitygroup" {
  description = "Name for the security group for ec2 instance"
  default = null
}
