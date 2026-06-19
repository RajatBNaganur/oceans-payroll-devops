#########################################
# EC2 Assume Role Policy
#########################################

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

#########################################
# Company IAM Role
#########################################

resource "aws_iam_role" "company_role" {
  name               = "company-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = local.common_tags
}

#########################################
# Bureau IAM Role
#########################################

resource "aws_iam_role" "bureau_role" {
  name               = "bureau-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = local.common_tags
}

#########################################
# Employee IAM Role
#########################################

resource "aws_iam_role" "employee_role" {
  name               = "employee-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = local.common_tags
}

#########################################
# Instance Profiles
#########################################

resource "aws_iam_instance_profile" "company_profile" {
  name = "company-profile"
  role = aws_iam_role.company_role.name
}

resource "aws_iam_instance_profile" "bureau_profile" {
  name = "bureau-profile"
  role = aws_iam_role.bureau_role.name
}

resource "aws_iam_instance_profile" "employee_profile" {
  name = "employee-profile"
  role = aws_iam_role.employee_role.name
}