resource "aws_iam_role" "cluster-role" {
  name               = "cluster-role"
  assume_role_policy = "${file("${path.module}/templates/roles/cluster-role.json")}"
}

resource "aws_iam_policy" "cluster_policy" {
  name   = "${var.cluster_name}-policy"
  description = "Nodes Policy"
  policy      = "${file("${path.module}/templates/policy/cluster-policy.json")}"
}

resource "aws_iam_policy_attachment" "cluster-attach" {
  name       = "${var.cluster_name}-attachment"
  roles      = ["${aws_iam_role.cluster-role.name}"]
  policy_arn = "${aws_iam_policy.cluster_policy.arn}"
}

resource "aws_iam_instance_profile" "cluster-role-profile" {
  name  = "cluster-role-profile"
  role = "${aws_iam_role.cluster-role.name}"
}