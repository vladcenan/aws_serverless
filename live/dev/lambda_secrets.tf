//Creates the Secrets Lambda Function
module "lambda_secrets" {
  source               = "../../control-lambda"
  awsRegion            = var.awsRegion
  environment          = var.environment
  createCount          = 1

  //lambda
  lambda_function_name     = "lambda-secrets"
  lambda_zip               = "lambda-secrets.zip"
  lambda_source_file       = "lambda-secrets.py"
  lambda_source_dir        = "lambdasrc"
  lambda_handler           = "lambda_handler"
  lambda_runtime           = "python3.7"
  lambda_timeout           = 300
  lambda_memory_size       = 1024
  lambda_role_arn          = module.iam.lambda_role
  secrets_manager_name     = module.secrets_manager.secrets-manager-name
  secrets_manager_endpoint = ""
  uuid1                    = local.uuid1
  uuid2                    = local.uuid2
}
