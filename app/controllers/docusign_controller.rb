class DocusignController < ApplicationController
  include DocuSign_eSign
  skip_before_action :verify_authenticity_token, only: [ :webhook ]
  before_action :ensure_authenticated, except: [ :webhook ]

  def send_document
    user = User.find(1)
    document_name = params[:document_name]
    document_path = get_document_path(document_name)

    begin
      config = Configuration.new
      config.host = ENV["DOCUSIGN_BASE_URL"]

      api_client = ApiClient.new(config)
      api_client.default_headers["Authorization"] = "Bearer #{access_token}"
      # if %w[in_progress started].include?(user.docusign_status) && user.envelope_id.present?
      #   recipient_view_request = RecipientViewRequest.new
      #   recipient_view_request.return_url = "http://localhost:3000"
      #   recipient_view_request.authentication_method = "none"
      #   recipient_view_request.user_name = user.username
      #   recipient_view_request.email = user.email
      #   recipient_view_request.client_user_id = user.id

      #   envelopes_api = EnvelopesApi.new(api_client)
      #   view_url = envelopes_api.create_recipient_view(ENV["DOCUSIGN_ACCOUNT_ID"], user.envelope_id, recipient_view_request)
      #   redirect_to view_url.url, allow_other_host: true
      #   return
      # end

      document_base64 = Base64.encode64(File.read(Rails.root.join(document_path)))

      document = Document.new
      document.document_base64 = document_base64
      document.name = document_name
      document.file_extension = "pdf"
      document.document_id = "1"

      signer = Signer.new
      signer.email = user.email
      signer.name = user.username
      signer.recipient_id = user.id
      signer.routing_order = "1"
      signer.client_user_id = user.id # Required for embedded signing

      sign_here = SignHere.new
      sign_here.document_id = document.document_id
      sign_here.page_number = "1"
      sign_here.recipient_id = user.id
      sign_here.tab_label = "SignHereTab"
      sign_here.x_position = "195"
      sign_here.y_position = "147"

      sign_here2 = SignHere.new
      sign_here2.document_id = document.document_id
      sign_here2.page_number = "2"
      sign_here2.recipient_id = user.id
      sign_here2.tab_label = "SignHereTab"
      sign_here2.x_position = "195"
      sign_here2.y_position = "147"

      tabs = Tabs.new
      tabs.sign_here_tabs = [ sign_here, sign_here2 ]
      signer.tabs = tabs

      recipients = Recipients.new
      recipients.signers = [ signer ]

      # Envelope defination is here
      envelope_definition = EnvelopeDefinition.new
      envelope_definition.email_subject = "Please sign: #{document_name}"
      envelope_definition.documents = [ document ]
      envelope_definition.recipients = recipients
      envelope_definition.status = "sent"
      # envelope_definition.brand_id = "15b33761-7037-4092-9e0b-01ad4ef9aba7"

      # Event data for webhook is here
      event_data = DocuSign_eSign::ConnectEventData.new
      event_data.format = "json"
      event_data.version = "restv2.1"
      event_data.include_data = [ "recipients" ]

      # envelope exipration is here
      envelope_expiration = DocuSign_eSign::Expirations.new
      envelope_expiration.expire_enabled = 'true'
      envelope_expiration.expire_after = '1'

      # notfication object is here
      notification = DocuSign_eSign::Notification.new
      notification.expirations = envelope_expiration
      envelope_definition.notification = notification

      # event notification object is created here
      event_notification = DocuSign_eSign::EventNotification.new
      event_notification.event_data = event_data
      event_notification.include_hmac = true
      event_notification.include_envelope_void_reason = true
      event_notification.url = "https://e5a9db81ca3c.ngrok-free.app/docusign/webhook?token=test"
      event_notification.require_acknowledgment = true
      event_notification.logging_enabled = true
      # event_notification.envelope_events = [
      #   DocuSign_eSign::EnvelopeEvent.new(envelope_event_status_code: "completed"),
      #   DocuSign_eSign::EnvelopeEvent.new(envelope_event_status_code: "declined"),
      #   DocuSign_eSign::EnvelopeEvent.new(envelope_event_status_code: "voided"),
      #   DocuSign_eSign::EnvelopeEvent.new(envelope_event_status_code: "delivered")
      # ]
      event_notification.recipient_events = [
        DocuSign_eSign::RecipientEvent.new(recipient_event_status_code: "delivered"),
      ]
      envelope_definition.event_notification = event_notification

      begin
        envelopes_api = EnvelopesApi.new(api_client)
        results = envelopes_api.create_envelope(ENV["DOCUSIGN_ACCOUNT_ID"], envelope_definition)
        envelope_id = results.envelope_id
        user.update(envelope_id:)
      rescue DocuSign_eSign::ApiError => e
        if e.code == 401
          session[:docusign_access_token] = nil
        else
          raise e
        end
      end

      # Embedded signing (recipient view request)
      recipient_view_request = RecipientViewRequest.new
      recipient_view_request.return_url = "http://localhost:3000" # Redirect after signing
      recipient_view_request.authentication_method = "none" # DocuSign requires 'none' for JWT embedded signing
      recipient_view_request.user_name = signer.name
      recipient_view_request.email = signer.email
      recipient_view_request.client_user_id = signer.client_user_id

      view_url = envelopes_api.create_recipient_view(ENV["DOCUSIGN_ACCOUNT_ID"], envelope_id, recipient_view_request)

      session[:envelopes] ||= []
      session[:envelopes] << {
        envelope_id: envelope_id,
        document_name: document_name,
        created_at: Time.current.iso8601,
        status: "sent"
      }

      user.update(docusign_status: "started")

      # VoidEnvelopeJob.set(wait: 60.seconds).perform_later(envelope_id, session[:docusign_access_token])

      redirect_to view_url.url, allow_other_host: true # Send user to the signing ceremony
    rescue => e
      redirect_to root_path, alert: "Failed to send document: #{e.message}"
    end
  end

  def status
    return redirect_to root_path, alert: "No envelopes found" unless session[:envelopes]

    begin
      config = Configuration.new
      config.host = ENV["DOCUSIGN_BASE_URL"]

      api_client = ApiClient.new(config)
      api_client.default_headers["Authorization"] = "Bearer #{access_token}"

      envelopes_api = EnvelopesApi.new(api_client)

      @envelopes = session[:envelopes].map do |envelope_info|
        envelope_status = envelopes_api.get_envelope(ENV["DOCUSIGN_ACCOUNT_ID"], envelope_info["envelope_id"])

        envelope_info.merge(
          "current_status" => envelope_status.status,
          "created_date" => envelope_status.created_date_time,
          "status_changed_date" => envelope_status.status_changed_date_time
        )
      end
    rescue => e
      @envelopes = session[:envelopes].map { |env| env.merge("current_status" => "error") }
      flash[:alert] = "Error fetching envelope status: #{e.message}"
    end
  end

  def webhook
    parsed_data = JSON.parse request.body.read
    status = parsed_data["status"]
    user = User.find_by(envelope_id: parsed_data["envelopeId"])

    binding.pry

    case status
    when "completed"
      DownloadDocusignSignedDocumentsJob.perform_later(user)
      user.update(docusign_status: status, completed_at: Time.parse(parsed_data["statusChangedDateTime"]))
    when "declined"
      user.update(docusign_status: status)
      # user.reason = parsed_data.dig("recipients", "signers", 0, "declinedReason")
    when "voided"
      user.update(docusign_status: status)
    when "delivered"
      user.update(docusign_status: "in_progress")
    end

    puts parsed_data
  end

  private

  def get_document_path(document_name)
    documents = {
      "Employment Agreement" => "pdfs/us_status_einzel.pdf"
      # 'Non-Disclosure Agreement' => 'app/assets/documents/nda.pdf',
      # 'Service Contract' => 'app/assets/documents/service_contract.pdf'
    }
    documents[document_name]
  end
end
