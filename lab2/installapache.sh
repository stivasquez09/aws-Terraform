#!/bin/bash
# ---> Updating, upgrating and installing the base
sudo -i
sudo yum update -y 
sudo yum install -y httpd

sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
echo "<html><h2>prueba de apache user data  stiven papito</h2></html>" > /var/www/html/index.html

#https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-centos-7-es
#validar el automatico de la pagina
