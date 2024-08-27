#creation basic ec2


resource "aws_instance" "ec2linux" {
  ami               = "ami-06c68f701d8090592" # us-west-1a
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  subnet_id         = aws_subnet.subnet1.id
  #security_groups = 
  vpc_security_group_ids =  [aws_security_group.sg1.id]
  key_name = "Lab1"


  tags = {
    Name = "tf-example"
  }

}

resource "aws_instance" "tf-pruebas" {
  ami               = "ami-06c68f701d8090592" # us-west-1a
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  subnet_id         = aws_subnet.subnet1.id
  #security_groups = 
  vpc_security_group_ids =  [aws_security_group.sg1.id]
  key_name = "class_key2"
  


  tags = {
    Name = "tf-pruebas"
  }

}
#ssh -i "class_key2.pem" ec2-user@ec2-52-87-186-101.compute-1.amazonaws.com
resource "aws_instance" "tf-pruebas2" {
  ami               = "${var.ami_id}" # us-west-1a
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  subnet_id         = aws_subnet.subnet1.id
  #security_groups = 
  vpc_security_group_ids =  [aws_security_group.sg1.id]
  key_name = "class_key2"
  user_data = file("installapache.sh")
  #user_data = "${var.data-new}"
 
 #user_data = <<EOF codigo aplicado en linea
 #EOF>>


  tags = {
    Name = "tf-pruebas2"
  }

}
#ssh -i "class_key2.pem" ec2-user@ec2-52-87-186-101.compute-1.amazonaws.com

resource "aws_instance" "server" {
  ami               = "${var.ami_id}" # us-west-1a
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  count = 3
  subnet_id         = aws_subnet.subnet1.id
  #security_groups = 
  vpc_security_group_ids =  [aws_security_group.sg1.id]
  key_name = "class_key2"
  user_data = file("installapache.sh")
  #user_data = "${var.data-new}"
 
 #user_data = <<EOF codigo aplicado en linea
 #EOF>>


  tags = {
    Name = "server.${count.index + 1}"
    owner = "Terraform"
    env = "DEV"
  }

}



# resource "aws_instance" "tf-pruebas4" {
#   ami               = "ami-04a81a99f5ec58529" ## Ubuntu" # us-west-1a
#   instance_type     = "t2.micro"
#   availability_zone = "us-east-1a"
#   subnet_id         = aws_subnet.subnet1.id
#   #security_groups = 
#   vpc_security_group_ids =  [aws_security_group.sg1.id]
#   key_name = "class_key2"
#   user_data = file("C:\\Users\\stiva\\OneDrive\\Escritorio\\terraform\\awspruebas\\lab1\\installapache.sh")
  
#   #user_data = "${var.data-new}"
 
#  #user_data = <<EOF codigo aplicado en linea
#  #EOF>>


#   tags = {
#     Name = "tf-pruebas3"
#   }

# }


# resource "aws_instance" "tf-default" {
#   ami               = "ami-04a81a99f5ec58529" ## Ubuntu" # us-west-1a
#   instance_type     = "t2.micro"
#   availability_zone = "us-east-1a"
#   subnet_id         = aws_subnet.subnet1.id
#   #security_groups = 
#   vpc_security_group_ids =  [aws_security_group.sg1.id]
#   key_name = "class_key2"
#   user_data = file("C:\\Users\\stiva\\OneDrive\\Escritorio\\terraform\\awspruebas\\lab1\\installapache.sh")
  
#   #user_data = "${var.data-new}"
 
#  #user_data = <<EOF codigo aplicado en linea
#  #EOF>>


#   tags = {
#     Name = "tf-default"
#   }

# }