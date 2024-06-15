terraform {
  backend "s3" {
    bucket         = "bilarn-terraform-bucket-state"
    key            = "bilarn-website-project.tfstate"
    region         = "us-east-1"
    profile         = "TESTING-AWS-GENERAL"
    encrypt        = false
  }
}