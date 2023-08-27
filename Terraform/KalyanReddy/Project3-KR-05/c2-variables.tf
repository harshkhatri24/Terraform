#Input variables
# AWS Region
variable "aws_region" {
    description = "Region in which AWS Resources to be created"
    type = string
    default = "ap-south-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that needs to be associated with EC2 Instance"
  type = string
  default = "terraform-key-1"
}

# AWS EC2 Instance Type - List
variable "instance_type_list" {
  description = "EC2 Instnace Type"
  type = list(string)
  default = ["t2.micro", "t2.micro", "t2.micro"]
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instnace Type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa"  = "t2.micro"
    "prod" = "t2.micro"
  }
}