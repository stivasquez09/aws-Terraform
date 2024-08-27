resource "aws_instance" "WEB01" {

  count         = var.ec2_count
  ami           = var.ami_id
  instance_type = var.instance_type
 subnet_id     = var.subnet_id

  tags = {
    Name  = "WEB01"
    owner = "Terraform"
    env   = "DEV"
  }
}
