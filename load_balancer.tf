data "aws_availability_zones" "available" {
  state = "available"
}

# Create a new load balancer
resource "aws_elb" "load_balancer" {
  name               = "terraform-elb"
  availability_zones = data.aws_availability_zones.available
  internal           = false
  load_balancer_type = "application"

  access_logs {
    bucket        = "lb"
    bucket_prefix = "logs"
    interval      = 60
  }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  }

  health_check {
    healthy_threshold   = 1
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}
