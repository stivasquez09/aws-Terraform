#!/bin/bash
sudo -i
sudo yum update -y 
sudo yum install -y httpd

sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
echo "<html><h2>prueba de apache user data  stiven papito</h2></html>" > /var/www/html/index.html

#https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-centos-7-es
#validar el automatico de la pagina



#UBUNTU
#!/bin/bash
# ---> Updating, upgrating and installing the base
apt update
apt install python3-pip apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update && apt upgrade -y
apt install docker-ce -y
systemctl status docker
usermod -aG docker ubuntu
docker run -p 3000:80 -d nginxdemos/hello

  