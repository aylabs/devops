provider "aws" {
  region = "eu-west-1"
}

module "ssh-key" {
  source = "./modules/ssh-key"
  key_name = var.key_name
}

resource "aws_security_group" "ssh" {
  name = "allow_ssh"
  description = "Allow SSH connections"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "swarm_node" {
  # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  ami = "ami-08edbb0e85d6a0a07"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ssh.id]
  key_name = var.key_name

  tags = {
    Name = "swarm"
  }
}