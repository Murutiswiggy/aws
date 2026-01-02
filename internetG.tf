resource "aws_internet_gateway" "internetgateway_1" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = var.internetgateway_1
  }
}