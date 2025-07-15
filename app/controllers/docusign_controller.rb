class DocusignController < ApplicationController
  include DocuSign_eSign
  skip_before_action :verify_authenticity_token, only: [:webhook]
  before_action :ensure_authenticated, except: [:webhook]

  def send_document
    document_name = params[:document_name]
    document_path = get_document_path(document_name)

    return redirect_to root_path, alert: 'Document not found' unless document_path

    begin
      config = Configuration.new
      config.host = ENV['DOCUSIGN_BASE_URL']

      api_client = ApiClient.new(config)
      api_client.default_headers['Authorization'] = "Bearer #{access_token}"

      document_base64 = Base64.encode64(File.read(Rails.root.join(document_path)))

      document = Document.new
      document.document_base64 = document_base64
      document.name = document_name
      document.file_extension = 'pdf'
      document.document_id = '1'

      signer = Signer.new
      signer.email = 'rahul.jha@united-signals.com'
      signer.name = 'Rahul Jha'
      signer.recipient_id = '1'
      signer.routing_order = '1'
      signer.client_user_id = '1234' # Required for embedded signing

      sign_here = SignHere.new
      sign_here.document_id = '1'
      sign_here.page_number = '1'
      sign_here.recipient_id = '1'
      sign_here.tab_label = 'SignHereTab'
      sign_here.x_position = '195'
      sign_here.y_position = '147'
      
      tabs = Tabs.new
      tabs.sign_here_tabs = [sign_here]
      signer.tabs = tabs
      
      recipients = Recipients.new
      recipients.signers = [signer]
      
      envelope_definition = EnvelopeDefinition.new
      envelope_definition.email_subject = "Please sign: #{document_name}"
      envelope_definition.documents = [document]
      envelope_definition.recipients = recipients
      envelope_definition.status = 'sent'

      envelopes_api = EnvelopesApi.new(api_client)
      results = envelopes_api.create_envelope(ENV['DOCUSIGN_ACCOUNT_ID'], envelope_definition)
      envelope_id = results.envelope_id

      # Embedded signing (recipient view request)
      recipient_view_request = RecipientViewRequest.new
      recipient_view_request.return_url = 'http://localhost:3000' # Redirect after signing
      recipient_view_request.authentication_method = 'none' # DocuSign requires 'none' for JWT embedded signing
      recipient_view_request.user_name = signer.name
      recipient_view_request.email = signer.email
      recipient_view_request.client_user_id = signer.client_user_id

      view_url = envelopes_api.create_recipient_view(ENV['DOCUSIGN_ACCOUNT_ID'], envelope_id, recipient_view_request)

      session[:envelopes] ||= []
      session[:envelopes] << {
        envelope_id: envelope_id,
        document_name: document_name,
        created_at: Time.current.iso8601,
        status: 'sent'
      }

      redirect_to view_url.url, allow_other_host: true # Send user to the signing ceremony
    rescue => e
      redirect_to root_path, alert: "Failed to send document: #{e.message}"
    end
  end
  
  def status
    return redirect_to root_path, alert: 'No envelopes found' unless session[:envelopes]
    
    begin
      config = Configuration.new
      config.host = ENV['DOCUSIGN_BASE_URL']
      
      api_client = ApiClient.new(config)
      api_client.default_headers['Authorization'] = "Bearer #{access_token}"
      
      envelopes_api = EnvelopesApi.new(api_client)
      
      @envelopes = session[:envelopes].map do |envelope_info|
        envelope_status = envelopes_api.get_envelope(ENV['DOCUSIGN_ACCOUNT_ID'], envelope_info['envelope_id'])
        
        envelope_info.merge(
          'current_status' => envelope_status.status,
          'created_date' => envelope_status.created_date_time,
          'status_changed_date' => envelope_status.status_changed_date_time
        )
      end
    rescue => e
      @envelopes = session[:envelopes].map { |env| env.merge('current_status' => 'error') }
      flash[:alert] = "Error fetching envelope status: #{e.message}"
    end
  end

  def webhook
    envelope_id = params[:data][:envelopeId]
    status = params[:data][:envelopeSummary][:status]

    if session[:envelopes]
      session[:envelopes].each do |envelope|
        if envelope['envelope_id'] == envelope_id
          envelope['status'] = status
          envelope['updated_at'] = Time.current.iso8601
        end
      end
    end

    Rails.logger.info "Webhook received for envelope #{envelope_id}: #{status}"

    head :ok
  end

  private

  def get_document_path(document_name)
    documents = {
      'Employment Agreement' => 'pdfs/us_status_einzel.pdf',
      # 'Non-Disclosure Agreement' => 'app/assets/documents/nda.pdf',
      # 'Service Contract' => 'app/assets/documents/service_contract.pdf'
    }
    documents[document_name]
  end
end
