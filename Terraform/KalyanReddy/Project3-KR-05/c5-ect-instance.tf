# Resource: EC2 Instance
resource "aws_instance" "kalyanTFEC2-1" {
    ami = data.aws_ami.amzlinux2.id
    #instance_type = var.instance_type
    instance_type= var.instance_type_list[1] #For List
    #instance_type = var.instance_type_map["prod"] #For Map
    user_data = file("${path.module}/app-install.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]

    # Meta-Argument Count
    count = 2

    # count.index
    tags = {
        "Name" = "Count-Demo-${count.index}"
    }
}