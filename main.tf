module "networking" {
  source = "./networking"
  region = var.region
}

module "ssh_key" {
  source = "./ssh-key"
}

module "compute" {
  source = "./compute"
  region = var.region
  zone   = var.zone

  vpc_id            = module.networking.vpc_id
  public_subnet_id  = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subnet_id
  ssh_public_key    = module.ssh_key.public_key
}
