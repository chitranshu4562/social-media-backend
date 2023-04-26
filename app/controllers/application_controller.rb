class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def generate_auth_token(payload)
    @expiration_time = (10.seconds.from_now - Time.current).to_i
    return JsonWebToken.encode(payload, @expiration_time)
  end

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { error: 'Invalid authentication token, please login again' }, status: :unauthorized
    end
  end
end
