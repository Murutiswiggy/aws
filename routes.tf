resource "aws_route_table" "route_1" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetgateway_1.id
  }


 tags = {
    Name = var.route_1
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.sub_1.id
  route_table_id = aws_route_table.route_1.id
}



resource "aws_route_table" "route_2" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetgateway_1.id
  }

 tags = {
    Name = var.route_2
  }
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.sub_2.id
  route_table_id = aws_route_table.route_2.id
}