output "mongodb-lambda-function-arn" {
  value = aws_lambda_function.main.*.arn
}

output "lambda-function-invoke-arn" {
  value = aws_lambda_function.main.*.invoke_arn
}
