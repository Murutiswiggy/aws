# data "aws_ssm_parameter" "ubuntu_22_04" {
#   name = "/aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
# }


# resource "aws_launch_template" "web_1" {
#   name_prefix   = "web-lt-"
#   image_id      = data.aws_ssm_parameter.ubuntu_22_04.value
#   instance_type = "t3.micro"

#   network_interfaces {
#     associate_public_ip_address = true
#     security_groups             = [aws_security_group.security_1.id]
#   }
#   iam_instance_profile {
#     name = aws_iam_instance_profile.role_profile.name
#   }

#   user_data = base64encode(<<-EOF
#               #!/bin/bash
#               yum install -y httpd
#               systemctl start httpd
#               systemctl enable httpd
#               echo "Hello from ASG" > /var/www/html/index.html
#               EOF
#   )

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name = "asg-launch-1"
#     }
#   }
# }


# resource "aws_autoscaling_group" "web_asg" {
#   name                = "web-asg"
#   min_size            = 1
#   max_size            = 3
#   desired_capacity    = 1
#   vpc_zone_identifier = [aws_subnet.sub_1.id, aws_subnet.sub_2.id]
#   health_check_type   = "EC2"

#   launch_template {
#     id      = aws_launch_template.web_1.id
#     version = "$Latest"
#   }

#   tag {
#     key                 = "Name"
#     value               = "asg-instance"
#     propagate_at_launch = true
#   }
# }
