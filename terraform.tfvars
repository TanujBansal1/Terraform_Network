aws_region            = "eu-west-1"
project_id            = "cmtr-sghaq6oo"
vpc_name              = "cmtr-sghaq6oo-vpc"
instance_type         = "t3.micro"
key_pair_name         = "cmtr-sghaq6oo-keypair"
instance_profile_name = "cmtr-sghaq6oo-instance_profile"
ec2_sg_name           = "cmtr-sghaq6oo-ec2_sg"
http_sg_name          = "cmtr-sghaq6oo-http_sg"
lb_sg_name            = "cmtr-sghaq6oo-sglb"
launch_template_name  = "cmtr-sghaq6oo-template"
asg_name              = "cmtr-sghaq6oo-asg"
load_balancer_name    = "cmtr-sghaq6oo-loadbalancer"
target_group_name     = "cmtr-sghaq6oo-tg"

asg_min_size     = 1
asg_max_size     = 2
asg_desired_size = 2

common_tags = {
  "Terraform" = "true"
  "Project"   = "cmtr-sghaq6oo"
}