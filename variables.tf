variable "aws_region" {
  description = "AWS region for resources"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
}

variable "nat_name" {
  description = "Name of the NAT Gateway"
  type        = string
}

variable "eip_name" {
  description = "Elastic IP name"
  type        = string
}

variable "public_subnet" {
  description = "Name of the public subnet"
  type        = string
}

variable "private_subnet" {
  description = "Name of the private subnet"
  type        = string
}

variable "public_subnet_az" {
  type        = string
  description = "Availability Zone for the public subnet"
}

variable "private_subnet_az" {
  type        = string
  description = "Availability Zone for the private subnet"
}

variable "route_table" {
  description = "Name of the route table"
  type        = string
}

variable "ami_id" {
  type        = string
  description = "AMI ID of EC2 Instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "ariane_instance_name" {
  description = "Name of the Ariane instance"
  type        = string
}

variable "falcon_instance_name" {
  description = "Name of the Falcon instance"
  type        = string
}

variable "redis_instance_name" {
  description = "Name of the Redis instance"
  type        = string
}

variable "ariane_security_group_rules" {
  description = "Rules for Ariane security group"
  type = list(object({
    protocol    = string
    port        = number
    source      = string
    description = string
  }))
}

variable "falcon_security_group_rules" {
  description = "Rules for Falcon security group"
  type = list(object({
    protocol    = string
    port        = number
    source      = string
    description = string
  }))
}

variable "redis_security_group_rules" {
  description = "Rules for Redis security group"
  type = list(object({
    protocol    = string
    port        = number
    source      = string
    description = string
  }))
}

variable "ariane_security_group_name" {
  type        = string
  description = "Name of Ariane Security Group"
}
variable "falcon_security_group_name" {
  type        = string
  description = "Name of Falcon Security Group"
}
variable "redis_security_group_name" {
  type        = string
  description = "Name of Redis Security Group"
}
