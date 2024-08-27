#grupos de seguridad creation

resource "aws_security_group" "sg1" {

  name        = "redes-ping"
  vpc_id      = aws_vpc.main1.id
  description = "Security group main"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # permite el ingreso desde cualquier lugar
    description = "permitir  ssh"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # permite el ingreso desde cualquier lugar
    description = "permitir  web"
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "permitir salida "
  }

  tags = { Name = "ping and ssh" }
}
