data "aws_ssm_parameter" "ubuntu_22" {
  name = "/aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}

resource "aws_launch_template" "launch-1" {
  name_prefix   = var.lt-1
  image_id      = data.aws_ssm_parameter.ubuntu_22.value
  instance_type = "t3.micro"

   network_interfaces {
    associate_public_ip_address = true   # <--- ENABLE PUBLIC IP HERE
    security_groups             = [aws_security_group.security_1.id]
  }

    iam_instance_profile {
    name = aws_iam_instance_profile.role1_profile.name
  }

  user_data = base64encode(<<EOF
#!/bin/bash
apt update -y
apt install -y apache2
echo "Hello from ASG Ubuntu" > /var/www/html/index.html
systemctl enable apache2
systemctl start apache2
EOF
  )
}



resource "aws_autoscaling_group" "ags-1" {
  vpc_zone_identifier = [
    aws_subnet.sub_1.id,
    aws_subnet.sub_2.id
  ]

  desired_capacity = var.asg_desired
  min_size         = var.asg_min
  max_size         = var.asg_max

  launch_template {
    id      = aws_launch_template.launch-1.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.tg1.arn]

  health_check_type         = "EC2"
  health_check_grace_period = 300


 tag {
    key                 = "Name"
    value               = "london-as-1"
    propagate_at_launch = true
  }
}