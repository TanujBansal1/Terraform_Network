resource "aws_instance" "this" {
  instance_type   = var.instance_type
  ami             = data.aws_ami.ami_id.id
  subnet_id       = data.aws_subnet.public_subnet.id
  security_groups = [data.aws_security_group.selected.id]

  tags = {
    Name    = var.ec2_instance_name
    Project = var.project_id
  }
}
