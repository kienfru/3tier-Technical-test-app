# VPC Module
module "vpc" {
  source = "./modules/vpc"

  vpc_name          = var.vpc_name
  cidr_block        = var.cidr_block
  public_cidr       = var.public_cidr
  private_cidr      = var.private_cidr
  igw_name          = var.igw_name
  nat_name          = var.nat_name
  eip_name          = var.eip_name
  public_subnet     = var.public_subnet
  public_subnet_az  = var.public_subnet_az
  private_subnet    = var.private_subnet
  private_subnet_az = var.private_subnet_az
  route_table       = var.route_table
}

# Security Groups Module
module "security_groups" {
  depends_on = [module.vpc]

  source = "./modules/securityGroups"

  vpc_id                     = module.vpc.vpc_id
  ariane_security_group_name = var.ariane_security_group_name
  falcon_security_group_name = var.falcon_security_group_name
  redis_security_group_name  = var.redis_security_group_name
  ariane_rules               = var.ariane_security_group_rules
  falcon_rules               = var.falcon_security_group_rules
  redis_rules                = var.redis_security_group_rules
}

# EC2 Module
module "ec2" {
  depends_on = [module.vpc, module.security_groups]

  source = "./modules/ec2"

  ami_id                = var.ami_id
  instance_type         = var.instance_type
  public_subnet_id      = module.vpc.public_subnet_id
  private_subnet_id     = module.vpc.private_subnet_id
  ariane_security_group = module.security_groups.ariane_security_group_id
  falcon_security_group = module.security_groups.falcon_security_group_id
  redis_security_group  = module.security_groups.redis_security_group_id

  ariane_instance_name = var.ariane_instance_name
  falcon_instance_name = var.falcon_instance_name
  redis_instance_name  = var.redis_instance_name
}
