harness_platform_triggers = {
  "TF Harness Account Setup" = {
    enable      = true
    description = "Trigger registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/triggers/terraform-harness-setup-trigger.tftpl"
  }
  "TF Harness Organization Setup" = {
    enable      = true
    description = "Inputset registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/triggers/terraform-harness-setup-trigger.tftpl"
  }
}
