harness_platform_pipelines = {
  /* "Terraform Pipeline" = {
    enable = true
    type   = "pipeline"
    vars = {
      description = "Pipeline generated by terraform harness provider"
      tags        = []
      yaml        = "./templates/pipelines/terraform-harness-configuration.tftpl"
    }
    default_values = {
      ENVIRONMENT_NAME = "google_cloud"
    }
    template = {
      pipeline = {
        template_name    = "Terraform Harness Configuration Pipeline"
        template_version = "1"
        template_level   = "account"
        type             = "pipeline"
      }
    }
  } */
  "Terraform GCP Infrastructure Pipeline" = {
    enable = true
    type   = "pipeline"
    vars = {
      description = "Pipeline generated by terraform harness provider"
      tags        = []
      yaml        = "./templates/pipelines/terraform-gcp-pipeline.tftpl"
    }
    template = {
      pipeline = {
        template_name    = "Terraform GCP Pipeline"
        template_version = "1"
        template_level   = "account"
        type             = "pipeline"
      }
    }
  }
}


