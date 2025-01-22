resource "aws_instance" "ariane" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet_id
  security_groups = [var.ariane_security_group]
  tags = {
    Name = var.ariane_instance_name
  }
}

resource "aws_instance" "falcon" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.private_subnet_id
  security_groups = [var.falcon_security_group]
  tags = {
    Name = var.falcon_instance_name
  }
}

resource "aws_instance" "redis" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.private_subnet_id
  security_groups = [var.redis_security_group]
  tags = {
    Name = var.redis_instance_name
  }
}
