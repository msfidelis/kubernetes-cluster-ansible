resource "aws_instance" "nodes-a" {
    count = 1
    ami = "ami-0a313d6098716f372"
    instance_type = "c4.large"

    subnet_id = "${var.public_subnet_1a}"

    associate_public_ip_address = true

    vpc_security_group_ids = ["${aws_security_group.cluster_sg.id}"]

    key_name = "${var.cluster_key}"

    tags {
        Name        = "${var.cluster_name}-node"
        Workload    = "kubernetes"
        Role        = "node"
    }
}


resource "aws_instance" "nodes-b" {
    count = 1
    ami = "ami-0a313d6098716f372"
    instance_type = "c4.large"

    subnet_id = "${var.public_subnet_1b}"

    associate_public_ip_address = true

    vpc_security_group_ids = ["${aws_security_group.cluster_sg.id}"]

    key_name = "${var.cluster_key}"

    tags {
        Name = "${var.cluster_name}-node"
        Workload = "kubernetes"
        Role = "node"
    }
}

resource "aws_lb_target_group_attachment" "nodes_a" {
    count = "${aws_instance.nodes-a.count}"
    target_group_arn = "${aws_alb_target_group.app_target_group.arn}"
    target_id        = "${element(split(",", join(",", aws_instance.nodes-a.*.id)), count.index)}"
    port             = 30001
}

resource "aws_lb_target_group_attachment" "nodes_b" {
    count = "${aws_instance.nodes-b.count}"
    target_group_arn = "${aws_alb_target_group.app_target_group.arn}"
    target_id        = "${element(split(",", join(",", aws_instance.nodes-b.*.id)), count.index)}"
    port             = 30001
}