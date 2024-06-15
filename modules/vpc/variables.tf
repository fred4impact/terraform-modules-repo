variable "region" {
  description = "AWS Region where the VPC will be create"
  type        = string
  default     = "us-east-1"
  
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}


variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "Bilarn"
}


variable "enviroment_name" {
  description = "The name of the environment"
  type        = string
  default     = "development"
}

variable "public_subnets" {
  description = "A list of public subnets"
  type        = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
  
}


variable "private_subnets" {
  description = "A list of private subnets"
  type        = list(string)
  default = [ "10.0.3.0/24" , "10.0.4.0/24"]
  
}

variable "public_route_table" {
  
    description = "The route table for the public subnets"
    type        = string   
}

variable "private_route_table" {
  
    description = "The route table for the private subnets"
    type        = string   
  
}
