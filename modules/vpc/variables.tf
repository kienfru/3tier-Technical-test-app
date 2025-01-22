variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_cidr" {
  type        = string
  description = "CIDR block for public subnet"
}

variable "private_cidr" {
  type        = string
  description = "CIDR block for private subnet"
}

variable "igw_name" {
  type        = string
  description = "Name of the Internet Gateway"
}

variable "nat_name" {
  type        = string
  description = "Name of the NAT Gateway"
}

variable "eip_name" {
  type        = string
  description = "Name of the Elastic IP"
}

variable "public_subnet" {
  type        = string
  description = "Name of the public subnet"
}

variable "public_subnet_az" {
  type        = string
  description = "Availability Zone for the public subnet"
}

variable "private_subnet_az" {
  type        = string
  description = "Availability Zone for the private subnet"
}

variable "private_subnet" {
  type        = string
  description = "Name of the private subnet"
}

variable "route_table" {
  type        = string
  description = "Name of the route table"
}
