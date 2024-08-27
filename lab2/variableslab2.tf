variable "region" {
    default = "us-east-1"
    description = "region que vamos a llamar en aws"
}
variable "nombre" {
    default = "dev"
  
}
variable "ami_id" {
  
  type = string 
  description = "AMI ID para LINUX AMAZON"
  default= "ami-06c68f701d8090592"
   
}

variable "vpc_cidr" {
    default = "192.168.0.0/16"
  
}

variable "subnet_cidr" {
    type = list(string)
    default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
   
  
}

variable "azs" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
 
}
