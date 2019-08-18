resource "aws_alb" "app_lb" {

    name            = "${var.cluster_name}-producao-alb"

    subnets = [
        "${var.public_subnet_1a}",
        "${var.public_subnet_1b}"
    ]

    security_groups = ["${aws_security_group.alb_sg.id}"]

    idle_timeout    = 600

    tags {
        Name            = "${var.cluster_name}-producao-alb"
        Organization    = "app"
    }

}

resource "aws_alb_target_group" "app_target_group" {

    name        = "${var.cluster_name}-producao-v1-trg"
    port        = "30001"
    protocol    = "HTTP"
    vpc_id      = "${var.vpc_id}"
    target_type = "instance"

    lifecycle { create_before_destroy = true }

    health_check {
        healthy_threshold   = 3
        unhealthy_threshold = 10
        timeout             = 5
        interval            = 30
        matcher             = "200"
        path                = "/healthcheck"
        port                = "30001"
    }

    depends_on = ["aws_alb.app_lb"]

}

resource "aws_alb_listener" "app_http" {

  load_balancer_arn = "${aws_alb.app_lb.arn}"
  port              = "80"
  protocol          = "HTTP"
  depends_on        = ["aws_alb_target_group.app_target_group"]

  default_action {
    target_group_arn = "${aws_alb_target_group.app_target_group.arn}"
    type             = "forward"
  }

}