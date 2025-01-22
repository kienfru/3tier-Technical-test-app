output "ariane_security_group_id" {
  value = aws_security_group.ariane.id
}

output "falcon_security_group_id" {
  value = aws_security_group.falcon.id
}

output "redis_security_group_id" {
  value = aws_security_group.redis.id
}
