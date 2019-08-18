output "alb_endpoint" {
  value = "${aws_alb.app_lb.dns_name}"
}