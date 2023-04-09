class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def generate_auth_token(payload)
    return JsonWebToken.encode(payload)
  end
end
