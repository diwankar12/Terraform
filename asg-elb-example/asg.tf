resource "aws_launch_configuration" "asg_launch_example" {

image_id = "ami-02da3a138888ced85"
instance_type = "t2.micro"
security_groups = ["${aws_security_group.sg_asg_example.id}"]

lifecycle {
 create_before_destroy = true
   }

   user_data = <<-EOF
   #!/bin/bash
   echo "Hello, World" > index.html
   nohup busybox httpd f p "${var.server_port}" &
   EOF

}


resource "aws_autoscaling_group" "asg_group_example" {
 name = "asg_example"
 launch_configuration = "${aws_launch_configuration.asg_launch_example.id}"
 health_check_type         = "ELB"
 load_balancers = ["${aws_elb.elb_example.name}"]
 availability_zones = ["${data.aws_availability_zones.available.names}"]
 min_size = 1
 max_size = 2
 lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "name"
    value               = "asg-example"
    propagate_at_launch = true
  }
}

#data source for finding az's

data "aws_availability_zones" "available"
{}
