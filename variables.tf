variable "block1" {
  default = "10.0.0.0/20"
}

variable "block2" {
  default = "10.0.0.0/24"
}

variable "block3" {
  default = "10.0.1.0/24"
}

variable "block4" {
  default = "0.0.0.0/0"
}

variable "vpc_name" {
  default = "main_self_vpc"
}

variable "publicsubnet1" {
  default = "web_subnet1"
}

variable "publicsubnet2" {
  default = "web_subnet2"
}

variable "routetable1" {
  default = "route_table_test"
}

variable "webzone1" {
  default = "us-east-1a"
}

variable "webzone2" {
  default = "us-east-1b"
}
