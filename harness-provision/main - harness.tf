# Create Connectores
module "bootstrap_harness_connectors" {
  source        = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-connector?ref=refactor"
  suffix        = random_string.suffix.id
  tags          = local.common_tags
  organizations = local.organizations
  projects      = local.projects
}

# Create Environments
module "bootstrap_harness_environments" {
  source                           = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-infrastructure?ref=refactor"
  suffix                           = random_string.suffix.id
  tags                             = local.common_tags
  organizations                    = local.organizations
  projects                         = local.projects
  templates                        = local.templates
  connectors                       = local.connectors
  harness_platform_environments    = var.harness_platform_environments
  harness_platform_infrastructures = var.harness_platform_infrastructures
}

# Create Pipelines
module "bootstrap_harness_pipelines" {
  source                     = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-pipeline?ref=refactor"
  suffix                     = random_string.suffix.id
  tags                       = local.common_tags
  organizations              = local.organizations
  projects                   = local.projects
  connectors                 = local.connectors
  templates                  = local.templates
  harness_platform_pipelines = var.harness_platform_pipelines
}

# Create Services
module "bootstrap_harness_services" {
  source                    = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-service?ref=refactor"
  suffix                    = random_string.suffix.id
  tags                      = local.common_tags
  organizations             = local.organizations
  projects                  = local.projects
  connectors                = local.connectors
  templates                 = local.templates
  harness_platform_services = local.harness_platform_services
}

# Create Inputsets
module "bootstrap_harness_inputsets" {
  source                     = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-inputset?ref=refactor"
  suffix                     = random_string.suffix.id
  tags                       = local.common_tags
  organizations              = local.organizations
  projects                   = local.projects
  connectors                 = local.connectors
  templates                  = local.templates
  harness_platform_services  = local.harness_platform_services
  pipelines                  = module.bootstrap_harness_pipelines.pipelines
  harness_platform_inputsets = var.harness_platform_inputsets
}

# Create Triggers
module "bootstrap_harness_triggers" {
  source                    = "git::https://github.com/crizstian/harness-terraform-modules.git//harness-trigger?ref=refactor"
  suffix                    = random_string.suffix.id
  tags                      = local.common_tags
  organizations             = local.organizations
  projects                  = local.projects
  connectors                = local.connectors
  templates                 = local.templates
  harness_platform_services = local.harness_platform_services
  pipelines                 = module.bootstrap_harness_pipelines.pipelines
  inputsets                 = module.bootstrap_harness_inputsets
  harness_platform_triggers = var.harness_platform_triggers
}
