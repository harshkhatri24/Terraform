# Resource: EC2 Instance
resource "aws_instance" "kalyanTFEC2-1" {
    ami = "ami-072ec8f4ea4a6f2cf"
    instance_type = "t2.micro"
    user_data = file("${path.module}/app1-install.sh")
    tags = {
        "Name" = "firstkalyanEC2"
    }
}