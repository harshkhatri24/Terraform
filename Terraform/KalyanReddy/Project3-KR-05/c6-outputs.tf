# Output - For Loop with List
output "for_output_list" {
    description = "For Loop with List"
    value = [for instance in aws_instance.kalyanTFEC2-1: instance.public_ip] 
}

# Output - For Loop with Map
output "for_output_map" {
    description = "For Loop with Map"
    value = {for instance in aws_instance.kalyanTFEC2-1: instance.id => instance.public_ip}
}

# Output - For Loop with Map Advanced
output "for_output_map2" {
    description = "For Loop with Map - Advanced"
    value = {for c, instance in aws_instance.kalyanTFEC2-1: c => instance.public_ip}
}

# Output Legacy Splat Operator (Legacy) - Returns the List
output "legacy_splat_instance_publicip" {
    description = "Legacy Splat Operator"
    value = aws_instance.kalyanTFEC2-1.*.public_ip
}

# Output Legacy Splat Operator (Legacy) - Returns the List
output "latest_splat_instance_publicip" {
    description = "Genralized latest Splat Operator"
    value = aws_instance.kalyanTFEC2-1[*].public_ip
}

