variable "ami_id" {
  type        = string
  description = "AMI ID of EC2 Instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID"
}

variable "private_subnet_id" {
  type        = string
  description = "Private subnet ID"
}

variable "ariane_security_group" {
  type        = string
  description = "Security group for Ariane instance"
}

variable "falcon_security_group" {
  type        = string
  description = "Security group for Falcon instance"
}

variable "redis_security_group" {
  type        = string
  description = "Security group for Redis instance"
}

variable "ariane_instance_name" {
  type        = string
  description = "Name of the Ariane instance"
}

variable "falcon_instance_name" {
  type        = string
  description = "Name of the Falcon instance"
}

variable "redis_instance_name" {
  type        = string
  description = "Name of the Redis instance"
}
