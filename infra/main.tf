provider "aws" {
  region = var.aws_region
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}

module "networking" {
  source       = "./modules/networking"
  project_name = var.project_name
}

module "security" {
  source       = "./modules/security"
  project_name = var.project_name
}

module "compute" {
  source               = "./modules/compute"
  project_name         = var.project_name
  vpc_id               = module.networking.vpc_id
  public_subnet_ids    = module.networking.public_subnet_ids
  private_subnet_ids   = module.networking.private_subnet_ids
  ec2_instance_profile = module.security.ec2_instance_profile
  ami_id               = var.ami_id
}