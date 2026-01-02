resource "aws_subnet" "sub_1" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = var.sub_IP_1
  map_public_ip_on_launch = true 
  availability_zone = "eu-west-2a"
depends_on = [aws_vpc.vpc_1]

  tags = {
    Name = var.sub_1
  }
}

resource "aws_subnet" "sub_2" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = var.sub_IP_2
  map_public_ip_on_launch = true 
  availability_zone = "eu-west-2b"
depends_on = [aws_vpc.vpc_1]

  tags = {
    Name = var.sub_2
  }
}
