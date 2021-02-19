

# Variable for security groups 
#############################
variable "securitygroupname" {
  description = "Name for the security group for ec2 instance"
  type = string
  default = "testsecurtygroup"
}

variable "portopen" {
  description = "port to open"
  type        = number
  default     = 22
}

variable "allportopen" {
  description = "port to open"
  type        = number
  default     = 0
}

variable "in_cidr_block" {
  description = "CIDR block the inbound ACL"
  default     = ["5.170.225.0/24"]
}

variable "out_cidr_block" {
  description = "CIDR block the outbound ACL"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}
