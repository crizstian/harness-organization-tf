resource "harness_platform_secret_text" "secret" {
  for_each                  = var.harness_platform_secrets_text
  identifier                = lower(replace(each.key, "/[\\s-.]/", "_"))
  name                      = each.key
  description               = "Cristian Secret generated by Terraform"
  secret_manager_identifier = "harnessSecretManager"
  value_type                = "Inline"
  value                     = each.value
}

resource "harness_platform_secret_file" "secret" {
  for_each                  = var.harness_platform_secrets_file
  identifier                = lower(replace(each.key, "/[\\s-.]/", "_"))
  name                      = each.key
  description               = "Cristian Secret generated by Terraform"
  secret_manager_identifier = "harnessSecretManager"
  file_path                 = each.value
}
