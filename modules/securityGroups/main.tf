resource "aws_security_group" "ariane" {
  vpc_id = var.vpc_id
  name   = var.ariane_security_group_name

  dynamic "ingress" {
    for_each = var.ariane_rules
    content {
      protocol    = ingress.value.protocol
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = [ingress.value.source]
      description = ingress.value.description
    }
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "falcon" {
  vpc_id = var.vpc_id
  name   = var.falcon_security_group_name

  dynamic "ingress" {
    for_each = var.falcon_rules
    content {
      protocol        = ingress.value.protocol
      from_port       = ingress.value.port
      to_port         = ingress.value.port
      security_groups = [aws_security_group.ariane.id]
      description     = ingress.value.description
    }
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "redis" {
  vpc_id = var.vpc_id
  name   = var.redis_security_group_name

  dynamic "ingress" {
    for_each = var.redis_rules
    content {
      protocol        = ingress.value.protocol
      from_port       = ingress.value.port
      to_port         = ingress.value.port
      security_groups = [aws_security_group.falcon.id]
      description     = ingress.value.description
    }
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
