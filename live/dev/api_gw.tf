//Creates cw event
module "api_gateway" {
  source            = "../../module-api-gateway"
  awsRegion         = var.awsRegion
  environment       = var.environment
  api_name          = "apigw"
  lambda_arn        = element(module.lambda_secrets.lambda-function-arn, 0)
  lambda_invoke_arn = element(module.lambda_secrets.lambda-function-invoke-arn, 0)
}
