output "ec2_public_ip" {
  value = aws_instance.webServerHost.public_ip
}

output "ec2_instance_id" {
  value = aws_instance.webServerHost.id
}