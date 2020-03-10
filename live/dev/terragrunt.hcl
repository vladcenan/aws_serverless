remote_state {
  backend = "s3"
  config = {
    bucket          = "mydevopscats"
    key             = "${path_relative_to_include()}/dev/terraform.tfstate"
    region          = "us-east-1"
    encrypt         = true
    #dynamodb_table = "terragrunt-locks"
  }
}
