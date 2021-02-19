# !  
# ? To deploy when want to work with AWS
# TODO use data source with self AMI, make variable for tagging map or object
# * create resource ec2 Aws Linux 2 with my own key pair

resource "aws_instance" "webserver" {
  #ami                    = data.aws_ami.amazon-ami-linux2-mostrecent.id
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.securitygroup 
  key_name               = var.keyname
  tags                   = var.tagsmap
  lifecycle { create_before_destroy = true }
  user_data = var.userdata
}


/*
resource "aws_ebs_volume" "ebs_vol" {
  availability_zone = aws_instance.webserver.availability_zone
  size = 2
  tags = {
    Name = var.tagname
    env = var.tagenv
    description = "web server managed by terraform"
  }
}


resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdc"
  instance_id = aws_instance.webserver.id
  volume_id = aws_ebs_volume.ebs_vol.id

}
*/
