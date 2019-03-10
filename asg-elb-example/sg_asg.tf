resource "aws_security_group" "sg_asg_example" {
  name        = "allow_busybox"
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
   create_before_destroy = true
     }

}
