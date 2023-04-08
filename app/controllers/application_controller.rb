class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def generate_auth_token(payload)
    return JsonWebToken.encode(payload)
  end

  def get_current_user(auth_token)
    user_detail = JsonWebToken.decode(auth_token)
    user_email = user_detail[:email]
    User.find_by(email: user_email)
  end
end
