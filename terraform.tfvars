aws_region = "eu-west-1"
common_tags = {
  "Project" = "cmtr-sghaq6oo"
}

vpc_id              = "vpc-008681e00a73050e3"
public_instance_id  = "i-05625050b6892e2f6"
private_instance_id = "i-04a610778cdf2bb7a"

ssh_security_group_name          = "cmtr-sghaq6oo-ssh-sg"
public_http_security_group_name  = "cmtr-sghaq6oo-public-http-sg"
private_http_security_group_name = "cmtr-sghaq6oo-private-http-sg"

allowed_ip_range = ["18.153.146.156/32", "183.83.232.175/32"]
