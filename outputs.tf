output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ariane_instance_id" {
  value = module.ec2.ariane_instance_id
}

output "falcon_instance_id" {
  value = module.ec2.falcon_instance_id
}

output "redis_instance_id" {
  value = module.ec2.redis_instance_id
}
