//Creates the Secrets Lambda Function
module "lambda_get" {
  source               = "../../control-lambda"
  awsRegion            = var.awsRegion
  environment          = var.environment
  createCount          = 1

  //lambda
  lambda_function_name     = "lambda-get"
  lambda_zip               = "lambda-get.zip"
  lambda_source_file       = "lambda-get.py"
  lambda_source_dir        = "lambdasrc2"
  lambda_handler           = "lambda_handler"
  lambda_runtime           = "python3.7"
  lambda_timeout           = 300
  lambda_memory_size       = 1024
  lambda_role_arn          = module.iam.lambda_role
  secrets_manager_name     = module.secrets_manager.secrets-manager-name
  secrets_manager_endpoint = "" //element(module.secretsmanager_vpc_endpoint.vpc-endpoint-name, 0) //var.secrets_manager_endpoint if None leave empty
}
