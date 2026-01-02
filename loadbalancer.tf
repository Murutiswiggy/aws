
# # 1. Create the Application Load Balancer (ALB)
# resource "aws_lb" "lb_1" {
#   name               = var.lb_1
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.security_1.id]
#   subnets            = [aws_subnet.sub_1.id, aws_subnet.sub_2.id]
 

#   tags = {
#     Environment = "Test"
#   }
# }

# # 2. Create the Target Group
# resource "aws_lb_target_group" "target_1" {
#   name     = var.target_1
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.vpc_1.id
#   target_type = "instance" # Can also be 'ip' or 'lambda'

#   health_check {
#     protocol            = "HTTP"
#     path                = "/"
#     enabled             = true
#     interval            = 30
#     timeout             = 10
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#     matcher             = "200"
#   }
# }

# # 3. Create a Listener to route traffic from the ALB to the Target Group
# resource "aws_lb_listener" "http_listener1" {
#   load_balancer_arn = aws_lb.lb_1.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.target_1.arn
#   }
# }

# # 4. (Optional) Attach a target (e.g., an EC2 instance) to the Target Group
# # This is typically done dynamically via Auto Scaling Groups, but can be manual if needed
# /*
# resource "aws_lb_target_group_attachment" "example_attachment" {
#   target_group_arn = aws_lb_target_group.app_tg.arn
#   target_id        = aws_instance.example_instance.id # Reference an EC2 instance resource ID
#   port             = 80 # Optional: port on the target itself
# }
# */

# # Output the DNS name of the Load Balancer so you can access it
# # output "lb_dns_name" {
# #   value = aws_lb.app_lb.dns_name
# #   description = "The DNS name of the Application Load Balancer."
# # }
