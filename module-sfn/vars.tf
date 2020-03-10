variable "awsRegion" {
  description = "Name of the environment, uat, nonprod, prod the EC2 will launch in"
  type        = string
}

variable "environment" {
  description = "Name of the environment, uat, nonprod, prod the EC2 will launch in"
  type        = string
}

variable "sfn_template" {
  description = "Step Function definition template"
  type        = string
}

variable "sfn_role" {
  description = "Step Function role"
  type        = string
}

variable "sfn_name" {
  description = "Step Function name"
  type        = string
}

variable "set-lambda-function-arn" {
  description = "ARN of the lambda"
  type        = string
}

variable "get-lambda-function-arn" {
  description = "ARN of the lambda"
  type        = string
}

variable "secrets-lambda-function-arn" {
  description = "ARN of the lambda"
  type        = string
}
