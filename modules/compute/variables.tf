variable "name_prefix" { type = string }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "subnet_ids" { type = list(string) }
variable "security_group_ids" { type = list(string) }
variable "desired_capacity" { type = number, default = 1 }
variable "min_size" { type = number, default = 1 }
variable "max_size" { type = number, default = 2 }
variable "tags" { type = map(string), default = {} }
