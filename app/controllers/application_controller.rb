class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception

  private

  def access_token
    session[:docusign_access_token]
  end

  def token_expired?
    return true unless session[:docusign_token_expires_at]
    Time.current > Time.at(session[:docusign_token_expires_at])
  end

  def ensure_authenticated
    if access_token.blank? || token_expired?
      redirect_to auth_docusign_path
    end
  end
end
