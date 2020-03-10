//Store Credentials in Secrets Manager
module "secrets_manager" {
  source        = "../../module-secrets-manager"
  secret_name   = "secret"
  recovery_days = 0
  secret_key    = {
    username = "root"
    password = local.password
  }
}
