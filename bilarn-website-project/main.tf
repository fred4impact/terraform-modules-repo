# Configure provider to authenticate the  aws env
provider "aws" {
  region = var.region
  profile = "fred-testing-aws-general"
}

#Provision a VPC Network
module "vpc" {
  source = "../modules/vpc"
  region = var.region
  vpc_cidr = var.vpc_cidr
  project_name = var.project_name
  enviroment_name = var.enviroment_name
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  public_route_table = var.public_route_table
  private_route_table = var.private_route_table
}

#Provision Security Groups
module "SecurityGroups" {
  source = "../modules/security-groups"
  vpc_id = module.vpc.vpc_id

}

#Provision EC2 Instances




