resource "aws_vpc" "main-module" {

  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "VPC-main-module"
    Location = "US"
  }

}

#subnet creation
resource "aws_subnet" "main-subnet-1" {
vpc_id = aws_vpc.main-module.id
cidr_block = "${var.subnet_cidr}"
availability_zone       = "us-east-1a"
map_public_ip_on_launch = true
  tags = {
    Name = "main-subnet-1"
    
  }
}
