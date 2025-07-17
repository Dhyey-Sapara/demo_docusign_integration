class VoidEnvelopeJob < ApplicationJob
  include DocuSign_eSign
  queue_as :default

  def perform(envelope_id, access_token)
    config = Configuration.new
    config.host = ENV["DOCUSIGN_BASE_URL"]

    api_client = ApiClient.new(config)
    api_client.default_headers["Authorization"] = "Bearer #{access_token}"

    envelopes_api = EnvelopesApi.new(api_client)

    # Check if envelope is still active before voiding
    envelope = envelopes_api.get_envelope(ENV["DOCUSIGN_ACCOUNT_ID"], envelope_id)

    if envelope.status == "sent" || envelope.status == "delivered"
      # Void the envelope
      envelope_definition = EnvelopeDefinition.new
      envelope_definition.status = "voided"
      envelope_definition.voided_reason = "Envelope expired after 1 minute"

      envelopes_api.update(ENV["DOCUSIGN_ACCOUNT_ID"], envelope_id, envelope_definition)

      Rails.logger.info "Envelope #{envelope_id} voided successfully due to expiration"
    else
      Rails.logger.info "Envelope #{envelope_id} already completed or voided, no action needed"
    end

  rescue DocuSign_eSign::ApiError => e
    Rails.logger.error "Failed to void envelope #{envelope_id}: #{e.message}"
    # Don't re-raise to avoid job retries for expired tokens or invalid envelope IDs
  rescue => e
    Rails.logger.error "Unexpected error voiding envelope #{envelope_id}: #{e.message}"
    raise e # Re-raise for unexpected errors to trigger job retry
  end
end
