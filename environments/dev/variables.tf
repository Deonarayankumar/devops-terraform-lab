variable "name_prefix" { type = string }
variable "environment" { type = string }
variable "vpc_cidr" { type = string }
variable "instance_type" { type = string }
variable "desired_capacity" { type = number }
variable "min_size" { type = number }
variable "max_size" { type = number }
