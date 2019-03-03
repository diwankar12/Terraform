resource "aws_eip" "webeip" {

instance = "${aws_instance.web-server.id}"

}

resource "aws_eip" "appeip" {

instance = "${aws_instance.app-server.id}"

}
