variable "ami_id" {
  description = "Ec2  AMI ID"
  default = "ami-0c55b159cbfafe1f0"
}
variable "instance_type" {
  description = "EC2  instance type"
 default = "t2.micro"
}

variable "public_subnets" {
 description = "EC2 Host public subnets" 
  
}
variable "key_name" {
   description = "value of key name"
   default = "fred-testing-aws-general"
}

variable "project_name" {
  
}

variable "enviroment_name" { 
}

variable "security_group_ids" {
  
}