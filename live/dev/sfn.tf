//Creates sfn state
module "sfn" {
  source                      = "../../module-sfn"
  awsRegion                   = var.awsRegion
  environment                 = var.environment
  sfn_name                    = "sfn"
  sfn_template                = "definitionTemplate.json"
  sfn_role                    = module.iam.sfn_role
  secrets-lambda-function-arn = element(module.lambda_secrets.lambda-function-arn, 0)
  set-lambda-function-arn     = element(module.lambda_set.lambda-function-arn, 0)
  get-lambda-function-arn     = element(module.lambda_get.lambda-function-arn, 0)
}
