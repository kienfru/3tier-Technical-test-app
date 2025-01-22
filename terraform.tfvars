aws_region = "us-east-1"

vpc_name          = "technical-test-vpc"
cidr_block        = "10.0.0.0/16"
public_cidr       = "10.0.1.0/24"
private_cidr      = "10.0.2.0/24"
igw_name          = "technical-test-internet-gateway"
nat_name          = "technical-test-nat-gateway"
eip_name          = "technical-test-eip"
public_subnet_az  = "us-east-1a"
public_subnet     = "technical-test-public"
private_subnet_az = "us-east-1b"
private_subnet    = "technical-test-private"
route_table       = "technical-test-routing-table"

ami_id        = "ami-0df8c184d5f6ae949"
instance_type = "t2.micro"

ariane_instance_name = "technical-test-ariane"
falcon_instance_name = "technical-test-falcon"
redis_instance_name  = "technical-test-redis"

ariane_security_group_name = "technical-test-ariane-security-group"

ariane_security_group_rules = [
  { protocol = "tcp", port = 443, source = "82.11.22.33/32", description = "Office" },
  { protocol = "tcp", port = 443, source = "81.44.55.87/32", description = "VPN" },
  { protocol = "tcp", port = 443, source = "87.12.33.88/32", description = "Home" },
]

falcon_security_group_name = "technical-test-falcon-security-group"

falcon_security_group_rules = [
  { protocol = "tcp", port = 4000, source = "sg-ariane-id", description = "technical-test-ariane-security-group" },
]

redis_security_group_name = "technical-test-redis-security-group"

redis_security_group_rules = [
  { protocol = "tcp", port = 6399, source = "sg-falcon-id", description = "technical-test-falcon-security-group" },
]
