resource "aws_lb" "lb" {
    name = "test_lb"
    load_balancer_type = "application"
}
