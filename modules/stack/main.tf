module "network" {
  source = "../network"

  name_prefix           = var.name_prefix
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  availability_zones    = var.availability_zones
  enable_nat_gateway    = var.enable_nat_gateway
  tags                  = local.tags
}

resource "aws_security_group" "app" {
  name   = "${var.name_prefix}-app-sg"
  vpc_id = module.network.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

module "compute" {
  source = "../compute"

  name_prefix          = var.name_prefix
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  subnet_ids           = module.network.private_subnet_ids
  security_group_ids   = [aws_security_group.app.id]
  desired_capacity     = var.desired_capacity
  min_size             = var.min_size
  max_size             = var.max_size
  tags                 = local.tags
}

module "monitoring" {
  source = "../monitoring"

  name_prefix = var.name_prefix
  asg_name    = module.compute.asg_name
  tags        = local.tags
}

locals {
  tags = {
    environment = var.environment
    project     = "devops-terraform-lab"
    managed_by  = "terraform"
  }
}
