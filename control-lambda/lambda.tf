module "lambda" {
  source                = "../module-lambda"
  awsRegion             = var.awsRegion
  createCount           = var.createCount
  environment           = var.environment
  lambda_function_name  = var.lambda_function_name
  lambda_handler        = var.lambda_handler
  lambda_runtime        = var.lambda_runtime
  lambda_role_arn       = var.lambda_role_arn
  lambda_timeout        = var.lambda_timeout
  lambda_memory_size    = var.lambda_memory_size
  lambda_zip            = "${path.module}/${var.lambda_zip}"
  lambda_source_file    = var.lambda_source_file
  lambda_source_dir     = "${path.module}/${var.lambda_source_dir}"
  lambda_source_content = data.template_file.lambda.rendered
  secrets_manager_name  = var.secrets_manager_name

  tags = {
    "Environment"          = var.environment
    "Creator"              = "terraform"
  }
}
