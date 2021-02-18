output "instance_ips" {
  value = aws_instance.webserver.*.public_ip
}
output "instance_dns" {
  value = aws_instance.webserver.*.public_dns
}