aws_region = "us-east-1"

# Network
vpc_name           = "lab-vpc"
vpc_cidr           = "10.0.0.0/16"
subnet1_name       = "lab-subnet-1"
subnet1_cidr       = "10.0.1.0/24"
availability_zone1 = "us-east-1a"
subnet2_name       = "lab-subnet-2"
subnet2_cidr       = "10.0.2.0/24"
availability_zone2 = "us-east-1b"
subnet3_name       = "lab-subnet-3"
subnet3_cidr       = "10.0.3.0/24"
availability_zone3 = "us-east-1c"
internet_gateway   = "lab-igw"
routing_table      = "lab-rt"

# Network security
ssh_security_group_name          = "lab-ssh-sg"
public_http_security_group_name  = "lab-public-http-sg"
private_http_security_group_name = "lab-private-http-sg"
allowed_ip_range                 = ["203.0.113.10/32", "198.51.100.20/32"]

# Application
aws_launch_template_name = "lab-launch-template"
aws_asg_name             = "lab-asg"
load_balancer            = "lab-alb"
instance_type            = "t3.micro"