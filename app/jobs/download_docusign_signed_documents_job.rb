class DownloadDocusignSignedDocumentsJob < ApplicationJob
  queue_as :default

  def perform(user)
    config = DocuSign_eSign::Configuration.new
    config.host = ENV['DOCUSIGN_BASE_URL']

    api_client = DocuSign_eSign::ApiClient.new(config)
    api_client.default_headers['Authorization'] = "Bearer #{RedisStorage.get_value("docusign_access_token")}"
    account_id = ENV['DOCUSIGN_ACCOUNT_ID']

    envelopes_api = DocuSign_eSign::EnvelopesApi.new(api_client)
    envelope_id = user.envelope_id
    begin
      document_list = envelopes_api.list_documents(account_id, envelope_id)
      download_dir = Rails.root.join('nfs', 'users', "#{user.id}", 'signed_documents')
      FileUtils.mkdir_p(download_dir)

      document_list.envelope_documents.each do |document|
        document_id = document.document_id
        file_path = File.join(download_dir, document.name)
        pdf_file_path = File.join(File.dirname(file_path), File.basename(file_path, '.*') + '.pdf')

        File.open(file_path, 'wb') do |file|
          temp_file = envelopes_api.get_document(account_id, document_id, envelope_id)
          FileUtils.cp(temp_file.path, pdf_file_path)
          temp_file.delete
        end

        Rails.logger.info "Downloaded #{document.name} for envelope #{envelope_id}"
      end

    rescue DocuSign_eSign::ApiError => e
      raise "Error downloading documents for envelope #{envelope_id}: #{e.message}"
    end
  end
end
