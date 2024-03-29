harness_platform_pipelines = {
  harness_seed_setup = {
    components = {
      pipeline = {
        enable      = true
        description = "Pipeline generated by terraform harness provider"
        file        = "templates/infrateam/pipelines/tf_account_setup.tpl"
        tags        = ["component: seed_setup"]
        stages = {
          terraform_sto_stage = {
            template_stage = true
            version        = "beta"
          }
        }
        vars = {
          approver_ref  = "account.SE_Admin"
          git_connector = "infrateam"
        }
      }
      inputset = {
        sto = {
          enable      = true
          file        = "templates/infrateam/inputsets/seed_tf_sto_inputset.tpl"
          description = "Inputset generated by terraform harness provider"
          tags        = ["component: seed_setup"]
          vars = {
            tf_folder         = "harness-provision"
            tf_backend_bucket = "crizstian-terraform"
            tf_workspace      = "<+trigger.sourceBranch>"
            docker_connector  = "shared_services"
            harness_api_key   = "<+secrets.getValue(\"account.cristian_harness_platform_api_key\")>"
          }
        }
        apply = {
          enable      = true
          file        = "templates/infrateam/inputsets/provisioning_seed_inputset_apply.tpl"
          description = "Inputset generated by terraform harness provider"
          tags        = ["component: seed_setup"]
          vars = {
            tf_folder         = "harness-provision"
            tf_backend_bucket = "crizstian-terraform"
            tf_workspace      = "<+trigger.sourceBranch>"
          }
        }
      }
      trigger = {
        github = {
          enable      = true
          tags        = ["component: seed_setup"]
          file        = "templates/infrateam/triggers/devsecops.tpl"
          description = "Trgger generated by terraform harness provider"
          inputset_ref = {
            "apply" = true
            "sto"   = true
          }
          vars = {}
        }
      }
    }
  }
}
