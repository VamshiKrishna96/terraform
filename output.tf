
output "instance_key_name" {
  description = "EC2 Instance Key Name"
  value       = aws_instance.ec2.key_name
}
output "instance_name" {
  description = "EC2 Instance Name"
  value       = aws_instance.ec2.tags["Name"]
}


# Networking


output "vpc_id" {
  description = "EC2 Instance Name"
  value       = aws_vpc.dev_vpc.id
}

output "subnet_id" {
  description = "Public Subnet Name"
  value       = aws_subnet.dev_subnet.id
}

output "subnet_id2" {
  description = "Public Subnet Name"
  value       = aws_subnet.dev_subnet-2.id
}
output "aws_internet_gateway" {
  description = "Custom Internet Gateway"
  value       = aws_internet_gateway.dev_igw.id
}
output "route_table_id" {
  description = "Route Table ID"
  value       = aws_route_table_association.dev_rt_asso
}
output "route" {
  description = "Route Table"
  value       = aws_route_table.dev_rt.id

}
output "Security" {
  description = "Security Group"
  value       = aws_security_group.dev_sg.name
}


output "instance_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.ec2.associate_public_ip_address
}

output "availability_zone" {
  value = aws_subnet.dev_subnet
  description = "Availability Zone"
}

output "instance_ip-2" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.ec2-instance.associate_public_ip_address
}

output "availability_zone_2" {
  value = aws_subnet.dev_subnet-2
  description = "Availability Zone 2"
}
