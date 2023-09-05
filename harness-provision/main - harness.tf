# Create Variables
module "bootstrap_harness_variables" {
  source                     = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-variable?ref=refactor"
  suffix                     = random_string.suffix.id
  tags                       = local.common_tags
  common_values              = local.common_values
  organizations              = local.organizations
  projects                   = local.projects
  harness_platform_variables = var.harness_platform_variables
}

# Create Connectores
module "bootstrap_harness_connectors" {
  source        = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-connector?ref=refactor"
  suffix        = random_string.suffix.id
  tags          = local.common_tags
  common_values = local.common_values
  organizations = local.organizations
  projects      = local.projects

  harness_platform_gitlab_connectors      = var.harness_platform_gitlab_connectors
  harness_platform_docker_connectors      = var.harness_platform_docker_connectors
  harness_platform_service_now_connectors = var.harness_platform_service_now_connectors
  harness_platform_dynatrace_connectors   = var.harness_platform_dynatrace_connectors
  harness_platform_gcp_connectors         = var.harness_platform_gcp_connectors
  harness_platform_aws_connectors         = var.harness_platform_aws_connectors
  harness_platform_newrelic_connectors    = var.harness_platform_newrelic_connectors
  harness_platform_helm_connectors        = var.harness_platform_helm_connectors
  harness_platform_kubernetes_connectors  = var.harness_platform_kubernetes_connectors
}

# Create Services
module "bootstrap_harness_services" {
  source                           = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-service?ref=refactor"
  suffix                           = random_string.suffix.id
  tags                             = local.common_tags
  common_values                    = local.common_values
  organizations                    = local.organizations
  projects                         = local.projects
  connectors                       = local.connectors
  templates                        = local.templates
  harness_platform_services        = local.harness_platform_services
  harness_platform_service_configs = var.harness_platform_service_configs
}

# Create Environments
module "bootstrap_harness_environments" {
  source                           = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-infrastructure?ref=refactor"
  suffix                           = random_string.suffix.id
  tags                             = local.common_tags
  common_values                    = local.common_values
  organizations                    = local.organizations
  projects                         = local.projects
  templates                        = local.templates
  connectors                       = local.connectors
  harness_platform_environments    = var.harness_platform_environments
  harness_platform_infrastructures = var.harness_platform_infrastructures
}

# Create Pipelines
module "bootstrap_harness_pipelines" {
  source        = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-pipeline?ref=refactor"
  suffix        = random_string.suffix.id
  tags          = local.common_tags
  common_values = local.common_values
  organizations = local.organizations
  projects      = local.projects
  connectors    = local.connectors
  templates     = local.templates
  /* usergroups                 = local.usergroups */
  harness_platform_pipelines = var.harness_platform_pipelines
}



# Create Inputsets
module "bootstrap_harness_inputsets" {
  source        = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-inputset?ref=refactor"
  suffix        = random_string.suffix.id
  tags          = local.common_tags
  common_values = local.common_values
  organizations = local.organizations
  projects      = local.projects
  connectors    = local.connectors
  templates     = local.templates
  /* usergroups                 = local.usergroups */
  harness_platform_services  = module.bootstrap_harness_services.services
  environments               = module.bootstrap_harness_environments.environment
  infrastructures            = module.bootstrap_harness_environments.infrastructure
  pipelines                  = module.bootstrap_harness_pipelines.pipeline
  harness_platform_inputsets = var.harness_platform_inputsets
}

# Create Triggers
module "bootstrap_harness_triggers" {
  source                    = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-trigger?ref=refactor"
  suffix                    = random_string.suffix.id
  tags                      = local.common_tags
  common_values             = local.common_values
  organizations             = local.organizations
  projects                  = local.projects
  connectors                = local.connectors
  templates                 = local.templates
  harness_platform_services = module.bootstrap_harness_services.services
  environments              = module.bootstrap_harness_environments.environment
  infrastructures           = module.bootstrap_harness_environments.infrastructure
  pipelines                 = module.bootstrap_harness_pipelines.pipeline
  inputsets                 = module.bootstrap_harness_inputsets
  harness_platform_triggers = var.harness_platform_triggers
}

/* 
# Create Environments
module "bootstrap_harness_overrides" {
  source                     = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-overrides?ref=refactor"
  suffix                     = random_string.suffix.id
  tags                       = local.common_tags
  common_values              = local.common_values
  organizations              = local.organizations
  projects                   = local.projects
  templates                  = local.templates
  connectors                 = local.connectors
  environments               = module.bootstrap_harness_environments.environment
  services                   = module.bootstrap_harness_services.services
  harness_platform_overrides = local.harness_platform_overrides
} */
