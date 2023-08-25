provider "aws" {
  region = "us-east-1"  
}

resource "aws_iam_group" "cloud_engineer_group" {
  name = "CloudEngineerGroup"
}

resource "aws_iam_user" "cloud_engineer_user" {
  name = "CloudEngineerUser"
}

resource "aws_iam_group_membership" "cloud_engineer_membership" {
  name = aws_iam_user.cloud_engineer_user.name
  users = [aws_iam_user.cloud_engineer_user.name]
  group = aws_iam_group.cloud_engineer_group.name
}

resource "aws_iam_role" "cloud_engineer_role" {
  name = "CloudEngineerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "cloud_engineer_policy" {
  name = "CloudEngineerPolicy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ec2:Start*",
          "ec2:Stop*",
          "ec2:RebootInstances"
        ],
        Effect = "Allow",
        Resource = "*"
      },
      {
        Action = "ec2:TerminateInstances",
        Effect = "Deny",
        Resource = "*"
      }
    ] 
  })
}

resource "aws_iam_policy_attachment" "cloud_engineer_policy_attachment" {
  name       = "CloudEngineerPolicyAttachment"
  policy_arn = aws_iam_policy.cloud_engineer_policy.arn
  roles      = [aws_iam_role.cloud_engineer_role.name]
  groups     = [aws_iam_group.cloud_engineer_group.name]
}
