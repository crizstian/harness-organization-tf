harness_platform_pipelines = {
  "TF Harness Account Setup" = {
    enable = true
    type   = "pipeline"
    vars = {
      organization = "cristian devsecops tf"
      project      = "organization setup"
      description  = "Pipeline generated by terraform harness provider"
      tags         = []
      yaml         = "./templates/pipelines/terraform-harness-account-setup.tftpl"
    }
    template = {
      pipeline = {
        template_name    = "TF Harness Account Setup"
        template_version = "1"
        template_level   = "account"
      }
    }
  }
  "TF Harness Organization Setup" = {
    enable = true
    type   = "pipeline"
    vars = {
      organization = "cristian devsecops tf"
      project      = "organization setup"
      description  = "Pipeline generated by terraform harness provider"
      tags         = []
      yaml         = "./templates/pipelines/terraform-harness-organization-setup.tftpl"
    }
    template = {
      pipeline = {
        template_name    = "TF Harness Organization Setup"
        template_version = "1"
        template_level   = "account"
      }
    }
  }
}


