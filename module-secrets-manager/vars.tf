variable "secret_name" {
  description = "Name of the AWS Secret Manager secret"
  type        = string
}

variable "secret_key" {
  description = "Name of the secret key that will have the json file as a value"
  type        = map
}

variable "recovery_days" {
  description = "Specifies the number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days."
}
