resource "oci_functions_function" "functions_functions" {
  for_each = var.functions_functions

  application_id                   = each.value.application_id
  display_name                     = each.value.display_name
  memory_in_mbs                    = each.value.memory_in_mbs
  config                           = each.value.config
  defined_tags                     = each.value.defined_tags
  detached_mode_timeout_in_seconds = each.value.detached_mode_timeout_in_seconds
  freeform_tags                    = each.value.freeform_tags
  image                            = each.value.image
  image_digest                     = each.value.image_digest
  timeout_in_seconds               = each.value.timeout_in_seconds

  dynamic "failure_destination" {
    for_each = each.value.failure_destination != null ? [each.value.failure_destination] : []
    content {
      channel_id = failure_destination.value.channel_id
      kind       = failure_destination.value.kind
      queue_id   = failure_destination.value.queue_id
      stream_id  = failure_destination.value.stream_id
      topic_id   = failure_destination.value.topic_id
    }
  }

  dynamic "provisioned_concurrency_config" {
    for_each = each.value.provisioned_concurrency_config != null ? [each.value.provisioned_concurrency_config] : []
    content {
      count    = provisioned_concurrency_config.value.count
      strategy = provisioned_concurrency_config.value.strategy
    }
  }

  dynamic "source_details" {
    for_each = each.value.source_details != null ? [each.value.source_details] : []
    content {
      dynamic "archive_source_details" {
        for_each = source_details.value.archive_source_details != null ? [source_details.value.archive_source_details] : []
        content {
          archive_file        = archive_source_details.value.archive_file
          archive_source_type = archive_source_details.value.archive_source_type
          bucket              = archive_source_details.value.bucket
          namespace           = archive_source_details.value.namespace
          object              = archive_source_details.value.object
          object_version_id   = archive_source_details.value.object_version_id
        }
      }
      handler        = source_details.value.handler
      image          = source_details.value.image
      image_digest   = source_details.value.image_digest
      pbf_listing_id = source_details.value.pbf_listing_id
      dynamic "runtime_config" {
        for_each = source_details.value.runtime_config != null ? [source_details.value.runtime_config] : []
        content {
          functions_runtime_name       = runtime_config.value.functions_runtime_name
          functions_runtime_version_id = runtime_config.value.functions_runtime_version_id
          runtime_config_type          = runtime_config.value.runtime_config_type
        }
      }
      source_type = source_details.value.source_type
    }
  }

  dynamic "success_destination" {
    for_each = each.value.success_destination != null ? [each.value.success_destination] : []
    content {
      channel_id = success_destination.value.channel_id
      kind       = success_destination.value.kind
      queue_id   = success_destination.value.queue_id
      stream_id  = success_destination.value.stream_id
      topic_id   = success_destination.value.topic_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "trace_config" {
    for_each = each.value.trace_config != null ? [each.value.trace_config] : []
    content {
      is_enabled = trace_config.value.is_enabled
    }
  }
}

