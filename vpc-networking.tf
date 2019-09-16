resource "aws_vpc" "apac" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name    = "SydneyVPC"
    Purpose = "APAC shared"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.apac.id}"
  cidr_block              = "${var.subnet_cidr}"
  map_public_ip_on_launch = true

  tags = {
    Name = "public"
  }
}

resource "aws_internet_gateway" "apac_igw" {
  vpc_id = "${aws_vpc.apac.id}"

  tags = {
    Name = "apac_igw"
  }
}

resource "aws_route_table" "pubroute" {
  vpc_id = "${aws_vpc.apac.id}"
  tags = {
    Name = "pubroute"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.apac_igw.id}"
  }
}

resource "aws_route_table_association" "pubroute" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.pubroute.id}"
}

resource "aws_security_group" "webserver" {
  name        = "webserver"
  description = "Allow 80 traffic"
  vpc_id      = "${aws_vpc.apac.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]

  }

  tags = {
    Name = "webserver"
  }
}
