output "functions_functions_id" {
  description = "Map of id values across all functions_functions, keyed the same as var.functions_functions except keys with no id are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "functions_functions_application_id" {
  description = "Map of application_id values across all functions_functions, keyed the same as var.functions_functions except keys with no application_id are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.application_id if v.application_id != null && length(v.application_id) > 0 }
}
output "functions_functions_compartment_id" {
  description = "Map of compartment_id values across all functions_functions, keyed the same as var.functions_functions except keys with no compartment_id are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "functions_functions_config" {
  description = "Map of config values across all functions_functions, keyed the same as var.functions_functions except keys with no config are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.config if v.config != null && length(v.config) > 0 }
}
output "functions_functions_defined_tags" {
  description = "Map of defined_tags values across all functions_functions, keyed the same as var.functions_functions except keys with no defined_tags are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "functions_functions_detached_mode_timeout_in_seconds" {
  description = "Map of detached_mode_timeout_in_seconds values across all functions_functions, keyed the same as var.functions_functions except keys with no detached_mode_timeout_in_seconds are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.detached_mode_timeout_in_seconds if v.detached_mode_timeout_in_seconds != null }
}
output "functions_functions_display_name" {
  description = "Map of display_name values across all functions_functions, keyed the same as var.functions_functions except keys with no display_name are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "functions_functions_failure_destination" {
  description = "Map of failure_destination values across all functions_functions, keyed the same as var.functions_functions except keys with no failure_destination are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => one(v.failure_destination) if v.failure_destination != null && length(v.failure_destination) > 0 }
}
output "functions_functions_freeform_tags" {
  description = "Map of freeform_tags values across all functions_functions, keyed the same as var.functions_functions except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "functions_functions_image" {
  description = "Map of image values across all functions_functions, keyed the same as var.functions_functions except keys with no image are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.image if v.image != null && length(v.image) > 0 }
}
output "functions_functions_image_digest" {
  description = "Map of image_digest values across all functions_functions, keyed the same as var.functions_functions except keys with no image_digest are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.image_digest if v.image_digest != null && length(v.image_digest) > 0 }
}
output "functions_functions_invoke_endpoint" {
  description = "Map of invoke_endpoint values across all functions_functions, keyed the same as var.functions_functions except keys with no invoke_endpoint are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.invoke_endpoint if v.invoke_endpoint != null && length(v.invoke_endpoint) > 0 }
}
output "functions_functions_memory_in_mbs" {
  description = "Map of memory_in_mbs values across all functions_functions, keyed the same as var.functions_functions except keys with no memory_in_mbs are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.memory_in_mbs if v.memory_in_mbs != null && length(v.memory_in_mbs) > 0 }
}
output "functions_functions_provisioned_concurrency_config" {
  description = "Map of provisioned_concurrency_config values across all functions_functions, keyed the same as var.functions_functions except keys with no provisioned_concurrency_config are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => one(v.provisioned_concurrency_config) if v.provisioned_concurrency_config != null && length(v.provisioned_concurrency_config) > 0 }
}
output "functions_functions_shape" {
  description = "Map of shape values across all functions_functions, keyed the same as var.functions_functions except keys with no shape are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.shape if v.shape != null && length(v.shape) > 0 }
}
output "functions_functions_source_details" {
  description = "Map of source_details values across all functions_functions, keyed the same as var.functions_functions except keys with no source_details are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => one(v.source_details) if v.source_details != null && length(v.source_details) > 0 }
}
output "functions_functions_state" {
  description = "Map of state values across all functions_functions, keyed the same as var.functions_functions except keys with no state are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.state if v.state != null && length(v.state) > 0 }
}
output "functions_functions_success_destination" {
  description = "Map of success_destination values across all functions_functions, keyed the same as var.functions_functions except keys with no success_destination are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => one(v.success_destination) if v.success_destination != null && length(v.success_destination) > 0 }
}
output "functions_functions_time_created" {
  description = "Map of time_created values across all functions_functions, keyed the same as var.functions_functions except keys with no time_created are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "functions_functions_time_updated" {
  description = "Map of time_updated values across all functions_functions, keyed the same as var.functions_functions except keys with no time_updated are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}
output "functions_functions_timeout_in_seconds" {
  description = "Map of timeout_in_seconds values across all functions_functions, keyed the same as var.functions_functions except keys with no timeout_in_seconds are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => v.timeout_in_seconds if v.timeout_in_seconds != null }
}
output "functions_functions_trace_config" {
  description = "Map of trace_config values across all functions_functions, keyed the same as var.functions_functions except keys with no trace_config are omitted"
  value       = { for k, v in oci_functions_function.functions_functions : k => one(v.trace_config) if v.trace_config != null && length(v.trace_config) > 0 }
}

