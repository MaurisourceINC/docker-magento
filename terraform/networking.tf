#  default vpc
data "aws_vpc" "default" {
  default = true
}



# Security group
resource "aws_security_group" "magento_sg" {
  name        = "magento_sg"
  description = "Security group for magento server connections support for http, https"
  vpc_id      =  data.aws_vpc.default.id

  tags = {
    Name : "magento-server-connections"
  }
}


resource "aws_vpc_security_group_ingress_rule" "ingress_http" {
  security_group_id = aws_security_group.magento_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}


resource "aws_vpc_security_group_ingress_rule" "ingress_https" {
  security_group_id = aws_security_group.magento_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}


resource "aws_vpc_security_group_ingress_rule" "ingress_ssh" {
  security_group_id = aws_security_group.magento_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}


resource "aws_vpc_security_group_egress_rule" "egress_all" {
  security_group_id = aws_security_group.magento_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
