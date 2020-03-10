terraform {
  backend "s3" {
  }
}

resource "local_file" "main" {
  content  = var.lambda_source_content
  filename = "${var.lambda_source_dir}/${var.lambda_source_file}"
}

data "archive_file" "main" {
  type        = "zip"
  output_path = var.lambda_zip
  source_dir  = var.lambda_source_dir
  depends_on  = [local_file.main]
}

resource "aws_lambda_function" "main" {
  count            = var.createCount
  filename         = data.archive_file.main.output_path
  function_name    = format(local.hostname, count.index + 1)
  handler          = "${var.lambda_function_name}.${var.lambda_handler}"
  runtime          = var.lambda_runtime
  role             = var.lambda_role_arn
  timeout          = var.lambda_timeout
  memory_size      = var.lambda_memory_size
  source_code_hash = data.archive_file.main.output_base64sha256

  environment {
    variables = {
      aws_region           = var.awsRegion
      lambda_name          = var.lambda_function_name
      secrets_manager_name = var.secrets_manager_name
    }
  }

  tags = merge(
    local.defaultTags,
    {
      "Name" = format(local.hostname, count.index + 1)
    },
    var.additionalTags,
  )
}
