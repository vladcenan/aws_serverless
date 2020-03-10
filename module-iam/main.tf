# Create SSM Role
resource "aws_iam_role" "ssm_role" {
  name               = "${var.environment}-ssm-role"
  assume_role_policy = file("${path.module}/ssm_policy.json")
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

# EC2 Instance Profile
resource "aws_iam_instance_profile" "ec2_iam_profile" {
  name = "${var.environment}-ec2-iam-profile"
  role = aws_iam_role.ssm_role.name
}

# Create SFN Role
resource "aws_iam_role" "sfn_role" {
  name               = "${var.environment}-sfn-role"
  assume_role_policy = file("${path.module}/sfn_policy.json")
}

resource "aws_iam_role_policy_attachment" "sfn-attach" {
  role       = aws_iam_role.sfn_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
}

# Create CW Role
resource "aws_iam_role" "cw_role" {
  name               = "${var.environment}-cw-role"
  assume_role_policy = file("${path.module}/cw_policy.json")
}

resource "aws_iam_role_policy_attachment" "cw-attach" {
  role       = aws_iam_role.cw_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSStepFunctionsFullAccess"
}

# Create Lambda Role
resource "aws_iam_role" "lambda_role" {
  name               = "${var.environment}-lambda-role"
  assume_role_policy = file("${path.module}/lambda_policy.json")
}

resource "aws_iam_role_policy_attachment" "lambda-ec2-attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda-secrets-attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_role_policy_attachment" "lambda-ssm-attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda-s3-attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
