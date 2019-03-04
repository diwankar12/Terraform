resource "aws_instance" "web-server" {
  ami           = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web.name}"]
  key_name = "demo.pem"

  tags = {
    Name = "web-server"
  }

  provisioner "remote-exec" {
     inline = [
     "sudo yum install -y epel-release",
     "sudo yum -y install ngnix",
     "sudo service nginx start"

       ]
     connection {
       type = "ssh"
       user = "ec2-user"
       private_key = "${file("./demo.pem")}"

     }


  }
}
