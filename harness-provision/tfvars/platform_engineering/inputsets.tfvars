harness_platform_inputsets = {
  "Account Configuration" = {
    enable      = true
    description = "Inputset registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/inputsets/terraform-harness-setup-input.tftpl"
    pipeline    = "Terraform Harness Platform Configuration Pipeline"
    default_values = {
      GCS_PREFIX       = "cristian-harness-ng"
      TERRAFORM_REPO   = "harness-bootstrap-tf"
      TERRAFORM_FOLDER = "harness-provision"
      TERRAFORM_BRANCH = "main"
      paths = [
        "account.tfvars",
        "projects.tfvars",
        "connectors.tfvars",
        "templates.tfvars"
      ]
    }
  }
  "Organization Configuration" = {
    enable      = true
    description = "Inputset registered by terraform harness provider"
    type        = "CD"
    yaml        = "./templates/inputsets/terraform-harness-setup-input.tftpl"
    pipeline    = "Terraform Harness Platform Configuration Pipeline"
    default_values = {
      GCS_PREFIX       = "cristian-harness-ng-org"
      TERRAFORM_REPO   = "harness-organization-tf"
      TERRAFORM_FOLDER = "harness-provision"
      TERRAFORM_BRANCH = "main"
      paths = [
        "account.tfvars",
        "connectors.tfvars",
        "environments.tfvars",
        "services.tfvars",
        "pipelines.tfvars",
        "inputsets.tfvars",
        "triggers.tfvars",
        "variables.tfvars"
      ]
    }
  }
}
