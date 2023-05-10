variable "remote_state" {}
# Harness Platform Entities
variable "harness_platform_default_connectors" {
  description = "Harness default connectors for the org"
  default     = {}
}
variable "harness_platform_kubernetes_connectors" {
  description = "Harness Organizations to be created in the given Harness account"
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


