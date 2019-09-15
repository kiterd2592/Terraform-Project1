variable "vpc_cidr" {
  default = "190.160.0.0/16"
}

variable "subnet_cidr" {
  default = "190.160.1.0/24"
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
