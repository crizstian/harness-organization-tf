harness_platform_environments = {
  "harness" = {
    enable           = true
    description      = "Environment generated by terraform harness provider"
    tags             = []
    type             = "Production"
    primary_artifact = "terraform"
  }
}

harness_platform_infrastructures = {
  "harness" = {
    description = "Infrastructure registered by terraform harness provider"
    type        = "CustomDeployment"
    yaml        = "./templates/infrastructure/terraform.tftpl"
    template = {
      "template-deployment" = {
        template_name    = "Terraform - Deployment"
        template_version = "1"
        template_level   = "account"
      }
    }
  }
}