resource "aws_instance" "web" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = true
  key_name                    = "apackey"
  subnet_id                   = "${aws_subnet.public.id}"
  user_data                   = "${file("install_lamp.sh")}"
  vpc_security_group_ids      = ["${aws_security_group.webserver.id}"]

  tags = {
    Name = "Lab_instance"
  }
}

resource "aws_key_pair" "apackey" {
  key_name   = "apackey"
  public_key = "${file("keypair")}"
}
