output "vpc_id" {

    value = aws_vpc.main-module.id
    description = "IP de La VPC MAIN"
  
}

output "subnet_id" {
    value = aws_subnet.main-subnet-1.id
    description = "IP de la SUBNET MAIN"
  
}