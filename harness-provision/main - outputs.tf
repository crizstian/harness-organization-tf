output "details" {
  value = merge(
    /* module.bootstrap_harness_connectors, */
    /* module.bootstrap_harness_environments, */
    /* { for k, v in module.bootstrap_harness_services.services : k => { identifier = v.identifier } }, */
    /* { pipelines = module.bootstrap_harness_pipelines.pipeline }, */
    /* { inputsets = module.bootstrap_harness_inputsets.inputset }, */
    /* { triggers = module.bootstrap_harness_triggers.trigger } */
  )
}
