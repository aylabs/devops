resource "aws_security_group_rule" "swarm_sgr_1" {
  security_group_id = var.security_group_id

  type        = "ingress"
  from_port   = 0
  to_port     = 2376
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "swarm_sgr_2" {
  security_group_id = var.security_group_id

  type        = "ingress"
  from_port   = 0
  to_port     = 2377
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "swarm_sgr_3" {
  security_group_id = var.security_group_id

  type        = "ingress"
  from_port   = 0
  to_port     = 7946
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "swarm_sgr_4" {
  security_group_id = var.security_group_id

  type        = "ingress"
  from_port   = 0
  to_port     = 7946
  protocol    = "udp"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "swarm_sgr_5" {
  security_group_id = var.security_group_id

  type        = "ingress"
  from_port   = 0
  to_port     = 4789
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "swarm_sgr_6" {
  security_group_id = var.security_group_id

  type        = "ingress"
  from_port   = 0
  to_port     = 4789
  protocol    = "udp"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "swarm_sgr_7" {
  security_group_id = var.security_group_id

  type        = "egress"
  from_port   = 0
  to_port     = 2376
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "swarm_sgr_8" {
  security_group_id = var.security_group_id

  type        = "egress"
  from_port   = 0
  to_port     = 2377
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "swarm_sgr_9" {
  security_group_id = var.security_group_id

  type        = "egress"
  from_port   = 0
  to_port     = 7946
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "swarm_sgr_10" {
  security_group_id = var.security_group_id

  type        = "egress"
  from_port   = 0
  to_port     = 7946
  protocol    = "udp"
  cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "swarm_sgr_11" {
  security_group_id = var.security_group_id

  type        = "egress"
  from_port   = 0
  to_port     = 4789
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "swarm_sgr_12" {
  security_group_id = var.security_group_id

  type        = "egress"
  from_port   = 0
  to_port     = 4789
  protocol    = "udp"
  cidr_blocks = ["0.0.0.0/0"]

}
