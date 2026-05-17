resource "aws_iam_group" "group" {
  name = var.iam_group_name
}

resource "aws_iam_policy" "name" {
  name        = var.iam_policy_name
  description = "Allows Write access on specific S3 Bucket"

  policy = templatefile("${path.module}/policy.json", {
    bucket_name = var.bucket_name
  })

  tags = merge(
    var.common_tag,
    {
      Name = var.iam_policy_name
    }
  )
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    sid     = "AllowAssumeEC2Role"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_role" {
  assume_role_policy = data.aws_iam_policy_document.policy_document.json
  name               = var.iam_role_name

  tags = merge(
    var.common_tag,
    {
      Name = var.iam_role_name
    }
  )
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.name.arn
}

resource "aws_iam_instance_profile" "name" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.iam_role.name

  tags = merge(
    var.common_tag,
    {
      Name = var.iam_instance_profile_name
    }
  )
}


