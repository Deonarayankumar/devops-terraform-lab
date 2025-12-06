include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules//stack"
}

inputs = {
  name_prefix    = "devops-staging"
  environment    = "staging"
  desired_capacity = 2
  instance_type  = "t3.small"
  vpc_cidr       = "10.31.0.0/16"
}
