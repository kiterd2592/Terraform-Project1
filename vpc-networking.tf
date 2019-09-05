resource "aws_vpc" "apac" {
  cidr_block       = "190.160.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name    = "SydneyVPC"
    Purpose = "APAC shared"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.apac.id}"
  cidr_block              = "190.160.1.0/24"
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
