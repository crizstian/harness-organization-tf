harness_platform_service_configs = {
  custom = {
    description = "Service registered by terraform harness provider"
    tags        = []
    yaml        = "./templates/services/terraform-service.tftpl"
    type        = "custom"
    template = {
      template-deployment = {
        template_name    = "Terraform - Deployment"
        template_version = "1"
        template_level   = "account"
      }
    }
    MANIFESTS = {}
    PIPELINE = {
      "Terraform GCP Infrastructure Pipeline" = {
        INPUTSET = true
      }
    }
  }
  helm = {
    description = "Service registered by terraform harness provider"
    tags        = []
    yaml        = "./templates/services/helm-service.tftpl"
    type        = "helm"
    PIPELINE = {
      /* "Helm Deployment Pipeline" = {
        INPUTSET = true
      } */
    }
  }
}


