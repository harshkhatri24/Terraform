# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"
  
  # VPC Basic Details
  name = "vpc-dev-tf"
  cidr = "10.1.0.0/16"
  azs = ["ap-south-1a","ap-south-1b"]
  private_subnets = ["10.1.1.0/24","10.1.2.0/24"]
  public_subnets = ["10.1.3.0/24","10.1.4.0/24"]

  # Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets = ["10.1.5.0/24","10.1.6.0/24"]

  # Create NAT Gateway
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true
  
  # Tags
  public_subnet_tags = {
    Name = "public-subnets"
  }

  private_subnet_tags = {
    Name = "private-subnets"
  }

  database_subnet_tags = {
    Name = "database-subnets"
  }

  tags = {
    Owner = "Harsh"
    Enviornment = "Dev"
  }

  vpc_tags = {
    Name = "VPC-Dev"
  }
}



