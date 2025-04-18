#!/bin/bash
# ---> Updating, upgrating and installing the base
sudo -i
sudo yum update -y 
sudo yum install -y httpd

sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
echo "<h1>Hola Mundo desde $(hostname -f)</h1>" > /var/www/html/index.html
#https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-centos-7-es
#validar el automatico de la pagina

