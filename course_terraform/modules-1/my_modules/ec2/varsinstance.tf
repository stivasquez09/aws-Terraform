variable "ec2_count" {
    default = "1"
  
}

variable "ami_id" {
  
  type = string 
  description = "AMI ID para LINUX AMAZON"
  default= "ami-06c68f701d8090592"
   
}

variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {
  
}