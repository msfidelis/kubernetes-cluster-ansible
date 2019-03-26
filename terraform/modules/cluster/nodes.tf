resource "aws_instance" "nodes-a" {
    count = 1
    ami = "ami-0a313d6098716f372"
    instance_type = "t2.micro"

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
    instance_type = "t2.micro"

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