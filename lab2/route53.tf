
resource "aws_route53_zone" "dev" {
  name = "dev.usuariosroot.com"

  tags = {
    Environment = "dev"
  }
    vpc {
    vpc_id = aws_vpc.lab2.id
  }
}

resource "aws_route53_record" "server1" {
  zone_id = aws_route53_zone.dev.id
  name    = "server.dev.usuariosroot.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.server[0].public_ip]
  #ecords = [aws_eip.lb.public_ip]
}
