provider "aws" {
  version = "~> 2.41"
  region  = "us-west-2"
}

resource "aws_security_group_rule" "my-rule" {
    type        = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_iam_policy" "basically_deny_all" {
  name        = "some_policy"
  path        = "/"
  description = "Some policy with a long description that denies anything"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Deny",
      "Resource": "*"
    }
  ]
}
EOF
}
