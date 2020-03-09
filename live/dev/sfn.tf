###Creates sfn state
module "sfn" {
  source                         = "../../module-stepfunction"
  awsRegion                      = var.awsRegion
  environment                    = var.environment
  application_instance           = var.application_instance
  application_name               = var.application_name
  sfn_name                       = "sfn"
  sfn_template                   = "definitionTemplate.json"
  sfn_role                       = module.iam.sfn_role
  secrets-lambda-function-arn    = element(module.set_secrets.lambda-function-arn, 0)
  aric-lambda-function-arn       = element(module.aric_instance.aric-lambda-function-arn, 0)
}
