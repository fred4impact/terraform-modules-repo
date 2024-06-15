resource "aws_instance" "webServerHost" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnets
  key_name      = var.key_name

  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "${var.project_name}-${var.enviroment_name}- webServerHost"
  }

   
}