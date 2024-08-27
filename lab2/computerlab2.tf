
resource "aws_instance" "server" {
  ami               = "${var.ami_id}" # us-west-1a
  instance_type     = "t2.micro"
  availability_zone = "${element(var.azs, count.index )}"
  count = "${length(var.azs)}"
  subnet_id         = "${element(aws_subnet.subnets.*.id, count.index)}"
  #security_groups = 
  vpc_security_group_ids =  [aws_security_group.sg1.id]
  key_name = "class_key2"
  user_data = file("installapache.sh")
  #user_data = "${var.data-new}"
 
 #user_data = <<EOF codigo aplicado en linea
 #EOF>>


  tags = {
    Name = "server${count.index + 1}"
    owner = "Terraform"
    env = "DEV"
  }

}