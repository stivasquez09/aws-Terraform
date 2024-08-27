provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      proyecto = "modules-1"
    }
  }

}

module "dev_infraestructure" {
  
  source = "./my_modules/vpc"
  vpc_cidr = var.vpc_cidr.id

}

  
# module "ec2" {
#   source = "./modules/vpc"
#   subnet_id = module.vpc.subnet_id

# } 