// Resource to create/manage a secret metadata with AWS Secrets Manager
resource "aws_secretsmanager_secret" "main" {
  name                    = var.secret_name
  description             = "credentials"
  recovery_window_in_days = var.recovery_days
}

// Resource to store/manage secret values
resource "aws_secretsmanager_secret_version" "main" {
  secret_id     = aws_secretsmanager_secret.main.id
  secret_string = jsonencode(var.secret_key)
}
