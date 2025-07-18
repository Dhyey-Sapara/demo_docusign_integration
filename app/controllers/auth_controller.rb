class AuthController < ApplicationController
  def docusign_auth
    begin
      private_key = File.read(ENV['DOCUSIGN_PRIVATE_KEY_PATH'])

      # Create API client
      configuration = DocuSign_eSign::Configuration.new
      configuration.host = ENV['DOCUSIGN_AUTH_SERVER'].sub(%r{^https?://}, '') # remove https://
      api_client = DocuSign_eSign::ApiClient.new(configuration)

      # Generate JWT access token
      token_response = api_client.request_jwt_user_token(
        ENV['DOCUSIGN_INTEGRATION_KEY'],
        ENV['DOCUSIGN_USER_ID'],
        private_key,
        60,
        'signature impersonation'
      )

      # Store token in session
      expires_in_seconds = token_response.expires_in.to_i

      # Store token in session
      RedisStorage.set_value("docusign_access_token", token_response.access_token)
      session[:docusign_access_token] = token_response.access_token
      session[:docusign_token_expires_at] = Time.current.to_i + (expires_in_seconds * 60)

      redirect_to root_path, notice: 'Successfully authenticated with DocuSign'
    rescue => e
      redirect_to root_path, alert: "Authentication failed: #{e.message}"
    end
  end

  def callback
    redirect_to root_path
  end
end
