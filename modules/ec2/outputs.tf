output "ariane_instance_id" {
  value = aws_instance.ariane.id
}

output "falcon_instance_id" {
  value = aws_instance.falcon.id
}

output "redis_instance_id" {
  value = aws_instance.redis.id
}
