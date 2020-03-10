output "ec2_iam_profile" {
  value = aws_iam_instance_profile.ec2_iam_profile.name
}

output "sfn_role" {
  value = aws_iam_role.sfn_role.arn
}

output "cw_role" {
  value = aws_iam_role.cw_role.arn
}

output "lambda_role" {
  value = aws_iam_role.lambda_role.arn
}

