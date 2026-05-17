aws_region      = "eu-west-1"
resource_prefix = "cmtr-sghaq6oo"
vpc_name        = "cmtr-sghaq6oo-vpc"
security_group  = "cmtr-sghaq6oo-sg"
instane_type    = "t2.micro"
ami_id          = "ami-0c13c2049f369d641"

common_tags = {
  "Project" = "epam-tf-lab"
  "ID"      = "cmtr-sghaq6oo"
}
