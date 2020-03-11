locals {
  password = random_password.password.result
}

resource "random_password" "password" {
  length  = 10
  special = false
}

resource "random_uuid" "uuid1" {}
resource "random_uuid" "uuid2" {}
