include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules//stack"
}

inputs = {
  name_prefix    = "devops-prod"
  environment    = "prod"
  desired_capacity = 3
  instance_type  = "t3.medium"
  vpc_cidr       = "10.32.0.0/16"
}
