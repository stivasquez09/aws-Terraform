#vpc creation
resource "aws_vpc" "lab2" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "VPC1"
    Location = "US"
  }
}

#subnet creation
resource "aws_subnet" "subnets" {
  vpc_id                  = aws_vpc.lab2.id
  cidr_block              = "${element(var.subnet_cidr, count.index)}"
  availability_zone       = "${element(var.azs, count.index )}"
  map_public_ip_on_launch = true
  count = "${length(var.azs)}"

  tags = {
    Name = "Subnet_Public${count.index + 1}"
  }
}

#internet gatawey creation
# vpc_id = aws_vpc.main.id validar esta forma de llamada 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.lab2.id
  tags = {
    Name = "Gateway-VPC1"
  }
}

resource "aws_eip" "public_ip" {
  domain = "vpc"
  tags = {
    Name = "new_eip"
  }
}

#routetable creation
resource "aws_route_table" "RBLAB1" {
  vpc_id = aws_vpc.lab2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "RBLAB1_public"
  }
}
resource "aws_route_table_association" "RTSUBNETS" {
  #subnet_id      = aws_subnet.foo.id
  #route_table_id = aws_route_table.bar.id
  count = "${length(var.subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.subnets.*.id, count.index)}"
  route_table_id = aws_route_table.RBLAB1.id
}