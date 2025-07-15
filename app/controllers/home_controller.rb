class HomeController < ApplicationController
  def index
    @documents = [
      { name: 'Employment Agreement', file_path: 'pdfs/us_status_einzel.pdf' },
      # { name: 'Non-Disclosure Agreement', file_path: 'app/assets/documents/nda.pdf' },
      # { name: 'Service Contract', file_path: 'app/assets/documents/service_contract.pdf' }
    ]

    @authenticated = access_token.present? && !token_expired?
  end
end
