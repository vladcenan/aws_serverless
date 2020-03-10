data "template_file" "lambda" {
  template = file("${path.module}/${var.lambda_source_file}")

  vars = {
    environment              = var.environment
    secrets_manager_name     = var.secrets_manager_name
    secrets_manager_endpoint = var.secrets_manager_endpoint == "" ? "None" : format("'%s'", var.secrets_manager_endpoint)
  }
}
