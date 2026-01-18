variable "name_prefix" { type = string }
variable "environment" { type = string }
variable "vpc_cidr" { type = string }
variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.30.1.0/24", "10.30.2.0/24"]
}
variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.30.11.0/24", "10.30.12.0/24"]
}
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}
variable "enable_nat_gateway" { type = bool, default = true }
variable "ami_id" { type = string, default = "ami-0c55b159cbfafe1f0" }
variable "instance_type" { type = string, default = "t3.micro" }
variable "desired_capacity" { type = number, default = 1 }
variable "min_size" { type = number, default = 1 }
variable "max_size" { type = number, default = 2 }
