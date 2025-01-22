variable "vpc_id" {
  type        = string
  description = "VPC ID where security groups will be created"
}

variable "ariane_security_group_name" {
  type        = string
  description = "Name of Ariane Security Group"
}

variable "ariane_rules" {
  type = list(object({
    protocol    = string
    port        = number
    source      = string
    description = string
  }))
}

variable "falcon_security_group_name" {
  type        = string
  description = "Name of Falcon Security Group"
}

variable "falcon_rules" {
  type = list(object({
    protocol    = string
    port        = number
    source      = string
    description = string
  }))
}

variable "redis_security_group_name" {
  type        = string
  description = "Name of Redis Security Group"
}

variable "redis_rules" {
  type = list(object({
    protocol    = string
    port        = number
    source      = string
    description = string
  }))
}
