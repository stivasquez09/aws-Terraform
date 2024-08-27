# output "ippublica" {

#     value = aws_instance.tf-pruebas2.public_ip
#     description = "optiene la ip public asociada."

# }

output "ip-public-nat" {
  value       = aws_eip.public_ip.public_ip
  description = "ip publica de navegacion"

}
