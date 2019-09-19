variable "vpc_cidr" {
  default = "190.160.0.0/16"
}

variable "subnet_cidr" {
  type    = "list"
  default = ["190.160.1.0/24", "190.160.2.0/24", "190.160.3.0/24"]
}

variable "azs" {
  type    = "list"
  default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

variable "region" {
  default = "ap-southeast-2"
}

variable "ami_id" {
  default = "ami-03ed5bd63ba378bd8"
}

variable "instance_type" {
  default = "t2.micro"
}
variable "vpc_subnet_ips" {
  type    = "list"
  default = ["190.160.1.0/24", "190.160.2.0/24", "190.160.3.0"]
}
