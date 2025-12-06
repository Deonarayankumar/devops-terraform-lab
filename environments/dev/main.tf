module "stack" {
  source = "../../modules/stack"

  name_prefix      = var.name_prefix
  environment      = var.environment
  vpc_cidr         = var.vpc_cidr
  instance_type    = var.instance_type
  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size
}
