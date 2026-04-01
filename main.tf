provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "abdelrahman-terraform-state-bucket-12345"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

module "vpc" {
  source = "github.com/abdosaad203/VPC-Module-abdelrahman"

  vpc_cidr = "10.0.0.0/16"
  vpc_name = "main-vpc"

  public_subnet_count  = 3
  private_subnet_count = 0

  ingress_ports = [80, 443, 22]
}

module "ec2" {
  source = "github.com/abdosaad203/EC2-Module-abdelrahman"

  instance_count = 3
  ami_id         = "ami-0c3389a4fa5bddaad"
  instance_type  = "t3.micro"
  key_name       = "ebs-lab"

  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.vpc.security_group_id

  ec2_name  = "web"
  user_data = file("${path.module}/userdata.sh")
}

module "alb" {
  source = "github.com/abdosaad203/ALB-Module-abdelrahman"

  alb_name = "main-alb"
  alb_type = "internet-facing"

  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.vpc.security_group_id

  instance_ids = module.ec2.instance_ids
}