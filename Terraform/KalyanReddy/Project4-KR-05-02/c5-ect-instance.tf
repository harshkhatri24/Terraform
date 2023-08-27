# AWS Availability Zones Data Sources
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Resource: EC2 Instance
resource "aws_instance" "kalyanTFEC2-1" {
    ami = data.aws_ami.amzlinux2.id
    #instance_type = var.instance_type
    instance_type= var.instance_type_list[1] #For List
    #instance_type = var.instance_type_map["prod"] #For Map
    user_data = file("${path.module}/app-install.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
    # Create EC2 instance in all AZ of a VPC
    for_each = toset(data.aws_availability_zones.my_azones.names)
    availability_zone = each.key # You can also use each.value because for list items each.key == each.value
    
    tags = {
        "Name" = "For-Each-Demo-${each.value}"
    }
}