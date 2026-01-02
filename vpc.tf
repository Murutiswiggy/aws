<<<<<<< HEAD
=======
##############################################
# VPC
##############################################
>>>>>>> d9a3e9a979ebb016649e3053aa778d2d7dfcf080
resource "aws_vpc" "vpc_1" {
  cidr_block       = var.vpc-IP
  instance_tenancy = "default"

  tags = {
<<<<<<< HEAD
    Name = var.vpc_1
  }
}
=======
    Name = var.vpc-1
  }
}

##############################################
# SUBNETS
##############################################

resource "aws_subnet" "sub_1" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.sub-IP-1
  availability_zone       = var.az1
  map_public_ip_on_launch = true
depends_on = [ aws_vpc.vpc_1 ]
  tags = {
    Name = var.sub-1
  }
}

resource "aws_subnet" "sub_2" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = var.sub-IP-2
  availability_zone = var.az2
  map_public_ip_on_launch = true
depends_on = [ aws_vpc.vpc_1 ]
  tags = {
    Name = var.sub-2
  }
}


##############################################
# INTERNET GATEWAY
##############################################
resource "aws_internet_gateway" "igw_1" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = var.igw-1
  }
}

##############################################
# ROUTE TABLE
##############################################
resource "aws_route_table" "route_1" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_1.id
  }

  tags = {
    Name = var.route-1
  }
}

resource "aws_route_table_association" "route_assoc_1" {
  subnet_id      = aws_subnet.sub_1.id
  route_table_id = aws_route_table.route_1.id
}

resource "aws_route_table" "route_2" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_1.id
  }

  tags = {
    Name = var.route-2
  }
}


resource "aws_route_table_association" "route_assoc_2" {
  subnet_id      = aws_subnet.sub_2.id
  route_table_id = aws_route_table.route_2.id
}


##############################################
# SECURITY GROUP
##############################################
resource "aws_security_group" "security_1" {
  name        = var.security-1
  description = "Allow HTTP, HTTPS, and SSH"
  vpc_id      = aws_vpc.vpc_1.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security-1
  }
}

##############################################
# IAM ROLE FOR SSM SESSION MANAGER
##############################################
# resource "aws_iam_role" "ssm_role" {
#   name = "ec2-ssm-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Effect = "Allow",
#       Principal = {
#         Service = "ec2.amazonaws.com"
#       },
#       Action = "sts:AssumeRole"
#     }]
#   })
# }

# resource "aws_iam_role_policy_attachment" "ssm_core" {
#   role       = aws_iam_role.ssm_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }

# resource "aws_iam_instance_profile" "ssm_profile" {
#   name = "ec2-ssm-instance-profile"
#   role = aws_iam_role.ssm_role.name
# }

data "aws_iam_role" "role1" {
  name = var.role-1
}

resource "aws_iam_instance_profile" "role1_profile" {
  name = var.role-profile-1
  role = data.aws_iam_role.role1.name
}

##############################################
# EC2 INSTANCE
##############################################
# resource "aws_instance" "ec2_1" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = "t3.micro"
#   subnet_id              = aws_subnet.sub_1.id
#   vpc_security_group_ids = [aws_security_group.security_1.id]
#   iam_instance_profile = aws_iam_instance_profile.role1_profile.name

#   tags = {
#     Name = var.ec2-1
#   }
# }

# ##############################################
# # UBUNTU AMI
# ##############################################
# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   owners = ["099720109477"] # Canonical
# }


>>>>>>> d9a3e9a979ebb016649e3053aa778d2d7dfcf080
