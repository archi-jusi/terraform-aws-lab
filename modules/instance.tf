resource "aws_instance" "webserver" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.securitygroupweb.id]
  tags = {
    Name = var.tagname
    env = var.tagenv
  }
  user_data = file("deploywebserver.sh")
}

resource "aws_security_group" "securitygroupweb" {
    name = "Security-group-http-only"
    description = "Allow only http access"
    ingress {
      from_port = var.portopen
      to_port = var.portopen
      protocol = "tcp"
      cidr_blocks = var.in_cidr_block 
    }
    egress {
    from_port   = var.allportopen
    to_port     = var.allportopen
    protocol    = "-1"
    cidr_blocks = var.out_cidr_block
  }
}