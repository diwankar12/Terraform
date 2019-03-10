resource "aws_elb" "elb_example" {

  name = "awselbexample"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  security_groups = ["${aws_security_group.sg_elb.id}"]


 listener {
   instance_port     = "${var.server_port}"
   instance_protocol = "http"
   lb_port           = 80
   lb_protocol       = "http"
 }

 health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:${var.server_port}/"
    interval            = 30
  }

  tags = {
      Name = "example-terraform-elb"
    }
}
