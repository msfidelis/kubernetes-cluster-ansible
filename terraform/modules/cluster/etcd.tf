
resource "aws_instance" "etcd-a" {
    count = 1
    ami = "ami-0a313d6098716f372"
    instance_type = "c4.large"

    subnet_id = "${var.public_subnet_1a}"

    associate_public_ip_address = true

    vpc_security_group_ids = ["${aws_security_group.cluster_sg.id}"]

    key_name = "${var.cluster_key}"

    tags {
        Name        = "${var.cluster_name}-master"
        Workload    = "kubernetes"
        Role        = "master"
    }
}
