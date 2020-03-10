output "mongodb-lambda-function-arn" {
  value = aws_lambda_function.main.*.arn
}

