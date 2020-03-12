locals {
  password = random_password.password.result
  uuid1    = random_uuid.uuid1.result
  uuid2    = random_uuid.uuid2.result
}

resource "random_password" "password" {
  length  = 10
  special = false
}

resource "random_uuid" "uuid1" {}
resource "random_uuid" "uuid2" {}
