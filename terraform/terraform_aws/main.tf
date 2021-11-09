provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "swarm_node" {
  count=var.cluster_size
  # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
  ami = "ami-08edbb0e85d6a0a07"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    aws_security_group.http.id,
    aws_security_group.swarm-sg.id
  ]
  key_name = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    echo "Check" > test.log
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    adduser ubuntu docker
  EOF

  tags = {
    Name = var.tag
  }
}

module "ssh-key" {
  source = "./modules/ssh-key"
  key_name = var.key_name
  tag = var.tag
}

resource "aws_security_group" "swarm-sg" {}
module "swarm-sg" {
  source = "./modules/swarm-security-group"
  security_group_id = aws_security_group.swarm-sg.id
  tag = var.tag
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

  tags = {
    Name = var.tag
  }
}

resource "aws_security_group" "http" {
  name = "allow_http_out"
  description = "Allow HTTP/S connections"

  ingress {
    from_port   = 0
    to_port     = 40001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.tag
  }
}

