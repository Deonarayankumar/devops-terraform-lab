include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules//stack"
}

inputs = {
  name_prefix    = "devops-dev"
  environment    = "dev"
  desired_capacity = 1
  instance_type  = "t3.micro"
  vpc_cidr       = "10.30.0.0/16"
}
