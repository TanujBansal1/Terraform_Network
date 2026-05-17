locals {
  keypair_name = "${var.resource_prefix}-keypair"
}

resource "aws_key_pair" "name" {
  public_key = var.ssh_key
  key_name   = local.keypair_name

  tags = merge(
    var.common_tags,
    {
      Name = local.keypair_name
    }
  )
}

