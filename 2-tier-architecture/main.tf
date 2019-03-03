resource "aws_instance" "web-server" {
  ami           = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web.name}"]

  tags = {
    Name = "web-server"
  }
}


resource "aws_instance" "app-server" {
  ami           = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.app.name}"]

  tags = {
    Name = "app-server"
  }
}
