harness_platform_triggers = {
  "TF Harness Account Setup" = {
    enable      = false
    description = "Trigger registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/triggers/terraform-harness-setup-trigger.tftpl"
  }
  "TF Harness Organization Setup" = {
    enable      = false
    description = "Inputset registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/triggers/terraform-harness-setup-trigger.tftpl"
  }
}
