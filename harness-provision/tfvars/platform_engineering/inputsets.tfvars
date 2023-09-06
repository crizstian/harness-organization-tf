harness_platform_inputsets = {
  "Account Configuration" = {
    enable      = true
    description = "Inputset registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/inputsets/terraform-harness-setup-input.tftpl"
    pipeline    = "Terraform Harness Platform Configuration Pipeline"
  }
  "Organization Configuration" = {
    enable      = true
    description = "Inputset registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/inputsets/terraform-harness-setup-input.tftpl"
    pipeline    = "Terraform Harness Platform Configuration Pipeline"
  }
}
