data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}




resource "aws_instance" "ec2_1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_1
  subnet_id     = aws_subnet.sub_1.id
  vpc_security_group_ids = [aws_security_group.security_1.id]

  iam_instance_profile = aws_iam_instance_profile.role_profile.name

  tags = {
    Name = var.ec2_1
  }
}
