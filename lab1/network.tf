#vpc creation
resource "aws_vpc" "main1" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "VPC1"
  }
}
#subnet creation
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.main1.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet1_public"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.main1.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet2_private"
  }
}


#internet gatawey creation
# vpc_id = aws_vpc.main.id validar esta forma de llamada 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main1.id
  tags = {
    Name = "Gateway"
  }
}

resource "aws_eip" "public_ip" {
  domain = "vpc"
  tags = {
    Name = "new_eip"
  }
}

resource "aws_nat_gateway" "main2" {
  depends_on        = [aws_internet_gateway.gw]
  allocation_id     = aws_eip.public_ip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.subnet2.id
  tags = {
    Name = "ngw"
  }
}
#routetable creation
resource "aws_route_table" "RBLAB1" {
  vpc_id = aws_vpc.main1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "RBLAB1_public"
  }
}
resource "aws_route_table" "RBLAB2" {
  vpc_id = aws_vpc.main1.id
  route {
    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.main2.id
  }
  tags = {
    Name = "RBLAB2_private"
  }
}
resource "aws_route_table_association" "RTSUB1" {
  #subnet_id      = aws_subnet.foo.id
  #route_table_id = aws_route_table.bar.id
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.RBLAB1.id
}

resource "aws_route_table_association" "RTSUB2" {
  #subnet_id      = aws_subnet.foo.id
  #route_table_id = aws_route_table.bar.id
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.RBLAB2.id
}

