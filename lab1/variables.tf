variable "ami_id" {
  
  type = string 
  description = "AMI ID para LINUX AMAZON"
  default= "ami-06c68f701d8090592"
   
}

variable "region" {
    description = "region a llamar en aws"
    default = "us-east-1a"
  
}

# variable "data-new" {
#     description = "llamado de user data"
#     #default = "${file("user-data.sh")}"
  
# }

# variable "subnet1_private_ip" {
#   description = "lista de ips para la subnet1"
#   type = list()
#  default =  ["192.168.1.1" , "192.168.1.2"]
# }