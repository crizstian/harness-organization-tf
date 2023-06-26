harness_platform_inputsets = {
  "TF Harness Account Setup" = {
    enable      = true
    description = "Inputset registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/inputsets/terraform-harness-setup-input.tftpl"
  }
  "TF Harness Organization Setup" = {
    enable      = true
    description = "Inputset registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/inputsets/terraform-harness-setup-input.tftpl"
  }
}
