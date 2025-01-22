resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = var.eip_name
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = var.nat_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_az
  tags = {
    Name = var.public_subnet
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_cidr
  availability_zone = var.private_subnet_az
  tags = {
    Name = var.private_subnet
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.route_table
  }
}

resource "aws_route_table" "main2" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.route_table
  }
}


resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.main2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         =    aws_nat_gateway.nat.id
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.main2.id
}
