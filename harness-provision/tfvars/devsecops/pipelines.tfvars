harness_platform_pipelines = {
  "TF Harness Account Setup" = {
    enable = true
    type   = "pipeline"
    vars = {
      description = "Pipeline generated by terraform harness provider"
      tags        = []
      yaml        = "./templates/pipelines/terraform-harness-setup.tftpl"
    }
    template = {
      pipeline = {
        template_name    = "TF Harness Account Setup"
        template_version = "1"
        template_level   = "account"
        type             = "pipeline"
      }
    }
  }
  "TF Harness Organization Setup" = {
    enable = true
    type   = "pipeline"
    vars = {
      description = "Pipeline generated by terraform harness provider"
      tags        = []
      yaml        = "./templates/pipelines/terraform-harness-setup.tftpl"
    }
    template = {
      pipeline = {
        template_name    = "TF Harness Organization Setup"
        template_version = "1"
        template_level   = "account"
        type             = "pipeline"
      }
    }
  }
}


