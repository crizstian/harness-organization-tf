variable "services_path" {
  default = ""
}

# common vars
locals {
  common_tags = [
    "terraform_workspace:${terraform.workspace}"
  ]

  organizations = data.terraform_remote_state.state.outputs.harness.organizations
  projects      = data.terraform_remote_state.state.outputs.harness.projects
  /* usergroups    = data.terraform_remote_state.state.outputs.usergroups */

  all_connectors = merge(
    data.terraform_remote_state.global.outputs.connectors.all,
    data.terraform_remote_state.state.outputs.connectors.all,
    {
      kubernetes_connectors = merge(
        try(data.terraform_remote_state.global.outputs.connectors.all.kubernetes_connectors, {}),
        try(data.terraform_remote_state.state.outputs.connectors.all.kubernetes_connectors, {}),
        {
          "${data.harness_platform_connector_kubernetes.account.name}" = {
            identifier  = "account.${data.harness_platform_connector_kubernetes.account.identifier}"
            environment = "pro"
          }
        }
      )
    },
    module.bootstrap_harness_connectors.all
  )

  connectors = merge(
    local.all_connectors,
    {
      default_connectors = {
        aws_connector_id    = try(local.all_connectors.aws_connectors[var.harness_platform_default_connectors.aws_connector].identifier, "NOT_SET")
        docker_connector_id = try(local.all_connectors.docker_connectors[var.harness_platform_default_connectors.docker_connector].identifier, "NOT_SET")
        gcp_connector_id    = try(local.all_connectors.gcp_connectors[var.harness_platform_default_connectors.gcp_connector].identifier, "NOT_SET")
        github_connector_id = try(local.all_connectors.github_connectors[var.harness_platform_default_connectors.github_connector].identifier, "NOT_SET")
        gitlab_connector_id = try(local.all_connectors.gitlab_connectors[var.harness_platform_default_connectors.gitlab_connector].identifier, "NOT_SET")
        k8s_connector_id    = try(local.all_connectors.kubernetes_connectors[var.harness_platform_default_connectors.kubernetes_connector].identifier, "NOT_SET")
      }
  })

  templates = merge(
    data.terraform_remote_state.global.outputs.templates.all,
    data.terraform_remote_state.state.outputs.templates.all
  )

  service_file_path         = var.services_path != "" ? var.services_path : "./tfvars/${terraform.workspace}/manifiestos"
  service_files             = fileset(local.service_file_path, "**/*.json")
  harness_platform_services = { for key, filename in local.service_files : element(split(".", key), 0) => jsondecode(file("${local.service_file_path}/${filename}")) }

  common_values = {
    org_id     = element([for org, details in local.organizations : details.identifier if lower(org) == lower(try(var.organization, ""))], 0)
    project_id = element([for prj, details in local.projects : details.identifier if lower(prj) == lower(try(var.project, ""))], 0)
  }

  harness_platform_overrides = { for svc, value in local.harness_platform_services : svc =>
    {
      OVERRIDES = value.OVERRIDES
    }
    if can(value.OVERRIDES)
  }
}
