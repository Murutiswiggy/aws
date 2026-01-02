resource "aws_vpc" "vpc_1" {
  cidr_block       = var.vpc-IP
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_1
  }
}