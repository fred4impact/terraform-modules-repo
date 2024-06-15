resource "aws_security_group" "alb-bilarn-security" {
  name        = "ALB Security Group"
  description = "Allow web traffic http port 80 and 443"
  vpc_id      = var.vpc_id

    ingress {
    description = "https Access port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
    description = "http Access port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    name = "Alb-bilarn-security"
  }
}


resource "aws_security_group" "ssh-security-group" {
  name        = "SSH Security Group"            
  description = "Allow SSH traffic port 22" 
  vpc_id      = var.vpc_id        


    ingress {
    description = "SSH Access port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.6.0/24"]
  
}

}

resource "aws_security_group" "webServerSecurityGroup" {
  name        = "Web Server Security Group"
  description = "Allow Web traffic 80, 443, 22"
  vpc_id      = var.vpc_id

  ingress {
    description = "http Access only"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb-bilarn-security.id]
    }

  ingress {
    description = "https Access only"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.alb-bilarn-security.id]
    } 
  
    ingress {
    description = "https Access only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.ssh-security-group.id]
    } 

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }  
  
  tags = {
    name = "webServerSecurityGroup"
  }
    
}



