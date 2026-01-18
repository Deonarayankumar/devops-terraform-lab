output "vpc_id" { value = module.network.vpc_id }
output "asg_name" { value = module.compute.asg_name }
output "log_group_name" { value = module.monitoring.log_group_name }
