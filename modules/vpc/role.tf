data "aws_iam_role" "role1" {
  name = var.role_1
}

resource "aws_iam_instance_profile" "role_profile" {
  name = var.role_profile
  role = data.aws_iam_role.role1.name
}