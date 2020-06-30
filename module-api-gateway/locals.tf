locals {
  hostname = format(
    "%s-%s",
    var.environment,
    var.api_name,
  )
}
