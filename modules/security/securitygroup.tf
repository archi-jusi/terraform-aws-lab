resource "aws_security_group" "securitygroupweb" {

  name        = var.securitygroupname

  ingress {
    from_port   = var.portopen
    to_port     = var.portopen
    protocol    = "tcp"
    cidr_blocks = var.in_cidr_block
  }
/*
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.in_cidr_block
  }
*/
  egress {
    from_port   = var.allportopen
    to_port     = var.allportopen
    protocol    = "-1"
    cidr_blocks = var.out_cidr_block
  }
  #revoke_rules_on_delete = true
  #lifecycle { create_before_destroy = true }
}
