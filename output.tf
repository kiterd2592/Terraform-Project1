output "instance_id" {
  value = "${aws_instance.web.*.id}"
}

output "public_dns" {
  value = "${(aws_instance.web.*.public_dns)}"
}

output "public_ip" {
  value = "${(aws_instance.web.*.public_ip)}"
}

output "subnet_id" {
  value = "${(aws_subnet.public.*.id)}"
}

output "elb_id" {
  value = "${(aws_elb.weblb.id)}"
}

output "elb_dns_name" {
  value = "${(aws_elb.weblb.dns_name)}"
}

output "elb_arn" {
  value = "${(aws_elb.weblb.arn)}"
}

output "sg_id" {
  value = "${(aws_security_group.webserver.id)}"
}
