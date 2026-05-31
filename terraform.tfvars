aws_region = "eu-west-1"

vpc_name            = "cmtr-sghaq6oo-vpc"
public_subnet1_name = "cmtr-sghaq6oo-public-subnet1"
public_subnet2_name = "cmtr-sghaq6oo-public-subnet2"
ssh_sg_name         = "cmtr-sghaq6oo-sg-ssh"
http_sg_name        = "cmtr-sghaq6oo-sg-http"
lb_sg_name          = "cmtr-sghaq6oo-sg-lb"

blue_weight  = 100
green_weight = 0

instance_type = "t3.micro"

asg_min_size         = 1
asg_max_size         = 2
asg_desired_capacity = 1

resource_prefix = "cmtr-sghaq6oo"

tags = {
  "Project"     = "blue-green-deployment"
  "Environment" = "lab"
  "ManagedBy"   = "terraform"
}