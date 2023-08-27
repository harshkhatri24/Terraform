# Terraform Output Values

# EC2 Instance Public IP with TOSET
output "instance_publicip" {
    description = "EC2 Instance Public IP"
    value = toset([for instance in aws_instance.kalyanTFEC2-1: instance.public_ip])
}

# EC2 Instance Public IP with TOMAP
output "instance_publicip2" {
    description = "EC2 Instance Public IP"
    value = tomap({for az, instance in aws_instance.kalyanTFEC2-1: az => instance.public_ip})
}

