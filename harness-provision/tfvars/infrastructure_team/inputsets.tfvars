harness_platform_inputsets = {
  "Terraform GCP Infrastructure Pipeline" = {
    enable      = true
    description = "Inputset registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/inputsets/terraform-gke-setup-input.tftpl"
  }
}
