variable "vpc-1" {
  default = "london-vpc-1"
}

variable "vpc-IP" {
  default = "17.16.0.0/16"
}

variable "sub-1" {
  default = "london-sub-1"
}

variable "az1" {
  default = "eu-west-2c"
}

variable "sub-IP-1" {
  default = "17.16.1.0/24"
}

variable "sub-2" {
  default = "london-sub-2"
}

variable "az2" {
  default = "eu-west-2a"
}

variable "sub-IP-2" {
  default = "17.16.2.0/24"
}

variable "igw-1" {
  default = "london-internet-1"
}

variable "route-1" {
  default = "london-route-1"
}

variable "route-2" {
  default = "london-route-2"
}

variable "security-1" {
  default = "london-security-1"
}

variable "role-1" {
  default = "role-1"
}

variable "role-profile-1" {
  default = "role-1-profile"
}

variable "ec2-1" {
  default = "london-ec2-1"
}

variable "lt-1" {
  default = "london-lt-1"
}

variable "asg_desired" {
  default = "1"
}

variable "asg_min" {
  default = "1"
}

variable "asg_max" {
  default = "4"
}