data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "image-id"
    values = ["ami-04a81a99f5ec58529"]
  }
}

resource "random_id" "magento_node" {
  byte_length = 2
  count       = var.main_instance_count
}

resource "aws_key_pair" "magento_node_id" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "magento_server" {
  count                  = var.main_instance_count
  instance_type          = var.main_instance_type
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.magento_node_id.id
  vpc_security_group_ids = [aws_security_group.magento_sg.id]
  user_data              = file("./install_docker.sh")

  root_block_device {
    volume_size = var.main_vol_size
  }

  tags = {
    Name = "magento-server-${random_id.magento_node[count.index].dec}"
  }
}
