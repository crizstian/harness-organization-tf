variable "services_path" {
  default = ""
}

# common vars
locals {
  common_tags = [
    "tf_workspace: ${terraform.workspace}"
  ]

  organizations = data.terraform_remote_state.state.outputs.harness.organizations
  projects      = data.terraform_remote_state.state.outputs.harness.projects

  all_connectors = merge(
    data.terraform_remote_state.global.outputs.connectors.all,
    module.bootstrap_harness_connectors.all
  )

  connectors = {
    all = local.all_connectors
    default_connectors = {
      aws_connector_id    = local.all_connectors.aws_connectors[var.harness_platform_default_connectors.aws_connector].identifier
      docker_connector_id = local.all_connectors.docker_connectors[var.harness_platform_default_connectors.docker_connector].identifier
      gcp_connector_id    = local.all_connectors.gcp_connectors[var.harness_platform_default_connectors.gcp_connector].identifier
      github_connector_id = local.all_connectors.github_connectors[var.harness_platform_default_connectors.github_connector].identifier
      gitlab_connector_id = local.all_connectors.gitlab_connectors[var.harness_platform_default_connectors.gitlab_connector].identifier
    }
  }

  templates = merge(
    data.terraform_remote_state.global.outputs.templates.all,
    data.terraform_remote_state.state.outputs.templates.all
  )

  service_file_path = var.services_path != "" ? var.services_path : "./tfvars/${terraform.workspace}/manifest"
  service_files     = fileset(local.service_file_path, "**/*.json")
  services          = toset(distinct([for key, filename in local.service_files : element(split("/", key), 0)]))
  jsons             = { for key, filename in local.service_files : key => jsondecode(file("${local.service_file_path}/${filename}")) }
  harness_platform_services = {
    for key, service in local.services : service => merge(
      [
        for file, content in local.jsons : content if element(split("/", file), 0) == service
      ]...
    )
  }

}
