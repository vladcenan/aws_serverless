// step function definition template
data "template_file" "main" {
  template = file("${path.module}/${var.sfn_template}")

  vars = {
    secrets-lambda-function-arn = var.secrets-lambda-function-arn
    get-lambda-function-arn    = var.get-lambda-function-arn
    set-lambda-function-arn    = var.set-lambda-function-arn
  }
}
