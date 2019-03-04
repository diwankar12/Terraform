resource "aws_eip" "webeip" {

instance = "${aws_instance.web-server.id}"

}
