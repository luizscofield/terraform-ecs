module "networking" {
  source         = "./modules/network"
  project_name   = var.project_name
  vpc_cidr_block = var.vpc_cidr_block
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
  app_name     = local.application_name
}

module "ecs" {
  source       = "./modules/ecs"
  project_name = var.project_name
  pub-subnets  = module.networking.subnets.public.id
  vpc_id       = module.networking.vpc.id
}