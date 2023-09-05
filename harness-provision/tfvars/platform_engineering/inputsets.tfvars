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
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/account.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/projects.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/connectors.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/templates.tfvars"
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
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/account.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/connectors.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/environments.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/services.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/pipelines.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/inputsets.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/triggers.tfvars",
        "harness-provision/tfvars/<+stage.variables.TERRAFORM_WORKSPACE>/variables.tfvars"
      ]
    }
  }
}
