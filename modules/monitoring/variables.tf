variable "name_prefix" { type = string }
variable "asg_name" { type = string }
variable "log_retention_days" { type = number, default = 14 }
variable "cpu_alarm_threshold" { type = number, default = 80 }
variable "tags" { type = map(string), default = {} }
