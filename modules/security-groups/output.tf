output "alb_security_group_id" {
  value = aws_security_group.alb-bilarn-security.id  
}



output "webServerSecurityGroup_id" {
    value = aws_security_group.webServerSecurityGroup.id
}

output "security_group_id" {
    value = aws_security_group.ssh-security-group.id
  
}
