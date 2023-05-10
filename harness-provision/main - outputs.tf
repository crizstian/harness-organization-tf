output "details" {
  value = merge(
    module.bootstrap_harness_connectors,
    module.bootstrap_harness_environments,
    module.bootstrap_harness_pipelines,
    module.bootstrap_harness_services,
    { inputset = module.bootstrap_harness_inputsets.inputset },
    module.bootstrap_harness_triggers,
  )
}
