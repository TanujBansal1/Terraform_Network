resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id       = data.terraform_remote_state.base_infra.outputs.public_subnet_id
  security_groups = [data.terraform_remote_state.base_infra.outputs.security_group_id]

  tags = {
    Name      = "EC2 Instance"
    Terraform = "true"
    Project   = var.project_id
  }
}

