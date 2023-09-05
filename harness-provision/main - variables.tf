variable "remote_state" {}
variable "organization" {
  description = "default value"
  default     = ""
}
variable "project" {
  description = "default value"
  default     = ""
}
# Harness Platform Entities
variable "harness_platform_default_connectors" {
  description = "Harness default connectors for the org"
  default     = {}
}

variable "harness_platform_environments" {
  description = "Harness Organizations to be created in the given Harness account"
  default     = {}
}

variable "harness_platform_infrastructures" {
  description = "Harness Organizations to be created in the given Harness account"
  default     = {}
}

variable "harness_platform_services" {
  description = "Harness Organizations to be created in the given Harness account"
  default     = {}
}

variable "harness_platform_pipelines" {
  description = "Harness Organizations to be created in the given Harness account"
  default     = {}
}

variable "harness_platform_inputsets" {
  description = "Harness Organizations to be created in the given Harness account"
  default     = {}
}

variable "harness_platform_triggers" {
  description = "Harness Organizations to be created in the given Harness account"
  default     = {}
}

variable "harness_platform_variables" {
  description = "Harness Organizations to be created in the given Harness account"
  default     = {}
}

variable "harness_platform_service_configs" {
  description = "Harness Organizations to be created in the given Harness account"
  default     = {}
}