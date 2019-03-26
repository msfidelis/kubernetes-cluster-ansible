resource "aws_security_group" "cluster_sg" {

  name        = "${var.cluster_name}-cluster-sg"
  description = "${var.cluster_name} cluster"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      self = true
      description = "nodes"
  }

  ingress {
      from_port = 0
      to_port = 65535
      protocol = "udp"
      self = true
      description = "nodes"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.cluster_name}-cluster-sg"
  }

}