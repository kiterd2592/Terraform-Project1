provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket         = "projectstate"
    key            = "project1/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "projectstate"
  }
}
