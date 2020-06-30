variable "awsRegion" {
  description = "Name of the environment, uat, nonprod, prod the EC2 will launch in"
  type        = string
}

variable "environment" {
  description = "Name of the environment, uat, nonprod, prod the EC2 will launch in"
  type        = string
}

variable "api_name" {
  description = "api gateway name"
  type        = string
}

variable "lambda_arn" {
  description = "lambda name"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "lambda arn"
  type        = string
}
