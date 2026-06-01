aws_region = "eu-west-1"

# Network
vpc_name = "cmtr-sghaq6oo-vpc"
vpc_cidr = "10.10.0.0/16"

subnet1_name       = "cmtr-sghaq6oo-subnet-public-a"
subnet1_cidr       = "10.10.1.0/24"
availability_zone1 = "eu-west-1a"

subnet2_name       = "cmtr-sghaq6oo-subnet-public-b"
subnet2_cidr       = "10.10.3.0/24"
availability_zone2 = "eu-west-1b"

subnet3_name       = "cmtr-sghaq6oo-subnet-public-c"
subnet3_cidr       = "10.10.5.0/24"
availability_zone3 = "eu-west-1c"

internet_gateway = "cmtr-sghaq6oo-igw"
routing_table    = "cmtr-sghaq6oo-rt"

# Network security
ssh_security_group_name          = "cmtr-sghaq6oo-ssh-sg"
public_http_security_group_name  = "cmtr-sghaq6oo-public-http-sg"
private_http_security_group_name = "cmtr-sghaq6oo-private-http-sg"
allowed_ip_range                 = ["18.153.146.156/32", "106.192.35.204/32"]

# Application
aws_launch_template_name = "cmtr-sghaq6oo-template"
aws_asg_name             = "cmtr-sghaq6oo-asg"
load_balancer            = "cmtr-sghaq6oo-lb"
instance_type            = "t3.micro"