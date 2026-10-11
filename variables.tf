variable "functions_functions" {
  description = <<EOT
Map of functions_functions, attributes below
Required:
    - application_id
    - display_name
    - memory_in_mbs
Optional:
    - config
    - defined_tags
    - detached_mode_timeout_in_seconds
    - freeform_tags
    - image
    - image_digest
    - timeout_in_seconds
    - failure_destination (block):
        - channel_id (optional)
        - kind (required)
        - queue_id (optional)
        - stream_id (optional)
        - topic_id (optional)
    - provisioned_concurrency_config (block):
        - count (optional)
        - strategy (required)
    - source_details (block):
        - archive_source_details (optional, block):
            - archive_file (optional)
            - archive_source_type (required)
            - bucket (optional)
            - namespace (optional)
            - object (optional)
            - object_version_id (optional)
        - handler (optional)
        - image (optional)
        - image_digest (optional)
        - pbf_listing_id (optional)
        - runtime_config (optional, block):
            - functions_runtime_name (required)
            - functions_runtime_version_id (optional)
            - runtime_config_type (required)
        - source_type (required)
    - success_destination (block):
        - channel_id (optional)
        - kind (required)
        - queue_id (optional)
        - stream_id (optional)
        - topic_id (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - trace_config (block):
        - is_enabled (optional)
EOT

  type = map(object({
    application_id                   = string
    display_name                     = string
    memory_in_mbs                    = string
    config                           = optional(map(string))
    defined_tags                     = optional(map(string))
    detached_mode_timeout_in_seconds = optional(number)
    freeform_tags                    = optional(map(string))
    image                            = optional(string)
    image_digest                     = optional(string)
    timeout_in_seconds               = optional(number)
    failure_destination = optional(object({
      channel_id = optional(string)
      kind       = string
      queue_id   = optional(string)
      stream_id  = optional(string)
      topic_id   = optional(string)
    }))
    provisioned_concurrency_config = optional(object({
      count    = optional(number)
      strategy = string
    }))
    source_details = optional(object({
      archive_source_details = optional(object({
        archive_file        = optional(string)
        archive_source_type = string
        bucket              = optional(string)
        namespace           = optional(string)
        object              = optional(string)
        object_version_id   = optional(string)
      }))
      handler        = optional(string)
      image          = optional(string)
      image_digest   = optional(string)
      pbf_listing_id = optional(string)
      runtime_config = optional(object({
        functions_runtime_name       = string
        functions_runtime_version_id = optional(string)
        runtime_config_type          = string
      }))
      source_type = string
    }))
    success_destination = optional(object({
      channel_id = optional(string)
      kind       = string
      queue_id   = optional(string)
      stream_id  = optional(string)
      topic_id   = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    trace_config = optional(object({
      is_enabled = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.functions_functions : (
        v.source_details == null || (contains([for v in ["ARCHIVE", "CONTAINER_IMAGE", "PRE_BUILT_FUNCTIONS"] : lower(v)], lower(v.source_details.source_type)))
      )
    ])
    error_message = "must be one of: \"ARCHIVE\", \"CONTAINER_IMAGE\", \"PRE_BUILT_FUNCTIONS\""
  }
  validation {
    condition = alltrue([
      for k, v in var.functions_functions : (
        v.source_details == null || (v.source_details.archive_source_details == null || (contains([for v in ["DIRECT_ARCHIVE", "OBJECT_STORAGE_ARCHIVE"] : lower(v)], lower(v.source_details.archive_source_details.archive_source_type))))
      )
    ])
    error_message = "must be one of: \"DIRECT_ARCHIVE\", \"OBJECT_STORAGE_ARCHIVE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.functions_functions : (
        v.source_details == null || (v.source_details.runtime_config == null || (contains([for v in ["FUNCTION_UPDATE", "MANUAL"] : lower(v)], lower(v.source_details.runtime_config.runtime_config_type))))
      )
    ])
    error_message = "must be one of: \"FUNCTION_UPDATE\", \"MANUAL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.functions_functions : (
        v.failure_destination == null || (contains([for v in ["NONE", "NOTIFICATION", "QUEUE", "STREAM"] : lower(v)], lower(v.failure_destination.kind)))
      )
    ])
    error_message = "must be one of: \"NONE\", \"NOTIFICATION\", \"QUEUE\", \"STREAM\""
  }
  validation {
    condition = alltrue([
      for k, v in var.functions_functions : (
        v.provisioned_concurrency_config == null || (contains([for v in ["CONSTANT", "NONE"] : lower(v)], lower(v.provisioned_concurrency_config.strategy)))
      )
    ])
    error_message = "must be one of: \"CONSTANT\", \"NONE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.functions_functions : (
        v.success_destination == null || (contains([for v in ["NONE", "NOTIFICATION", "QUEUE", "STREAM"] : lower(v)], lower(v.success_destination.kind)))
      )
    ])
    error_message = "must be one of: \"NONE\", \"NOTIFICATION\", \"QUEUE\", \"STREAM\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

