# ------------------------------------------------------------
# VPC Data Source (Required)
# ------------------------------------------------------------
data "aws_vpc" "vpc_1" {
  default = true
}

# ------------------------------------------------------------
# Load Balancer
# ------------------------------------------------------------

resource "aws_lb" "alb_1" {
  name               = "london-alb-1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_1.id]

  subnets = [
    aws_subnet.sub_1.id,
    aws_subnet.sub_2.id
  ]
}


# ------------------------------------------------------------
# Target Group
# ------------------------------------------------------------
resource "aws_lb_target_group" "tg1" {
  name     = "london-tg-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_1.id

  health_check {
    protocol = "HTTP"
    path     = "/"
    port     = "80"
  }
}

# ------------------------------------------------------------
# Listener (Corrected)
# ------------------------------------------------------------
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.alb_1.arn   # FIXED (underscore, not hyphen)
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}


# # ------------------------------------------------------------
# # EC2 Instance (Example)
# # ------------------------------------------------------------
# resource "aws_instance" "web" {
#   ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
#   instance_type               = "t2.micro"
#   subnet_id                   = data.aws_subnets.default.ids[0]
#   associate_public_ip_address = true

#   user_data = <<EOF
# #!/bin/bash
# sudo yum install -y httpd
# sudo systemctl start httpd
# sudo systemctl enable httpd
# echo "Hello from $(hostname)" > /var/www/html/index.html
# EOF
# }