output "instance_ips" {
  value = aws_instance.webserver.*.public_ip
}
output "instance_dns" {
  value = aws_instance.webserver.*.public_dns
}
output "amiid" {
  value = aws_instance.webserver.ami
}

output "az" {
  value = aws_instance.webserver.availability_zone
}
