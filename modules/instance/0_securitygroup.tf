resource "aws_security_group" "securitygroupweb" {

  name        = var.securitygroupname
  description = "Allow only http access"
  ingress {
    from_port   = var.portopen
    to_port     = var.portopen
    protocol    = "tcp"
    cidr_blocks = var.in_cidr_block
  }
  egress {
    from_port   = var.allportopen
    to_port     = var.allportopen
    protocol    = "-1"
    cidr_blocks = var.out_cidr_block
  }
  revoke_rules_on_delete = true
  lifecycle { create_before_destroy = true }
}
