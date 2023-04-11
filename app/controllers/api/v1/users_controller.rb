class Api::V1::UsersController < ApplicationController
  def user_signup
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      payload = { user_id: user.id, email: user.email }
      auth_token = generate_auth_token(payload)
      render json: { id: user.id, email: user.email, auth_token: auth_token, message: 'User is created successfully'}, status: 200
    else
      render json: { error: user.errors.full_messages}, status: 400
    end
  end

  def user_login
    begin
      user = User.find_by(email: params[:email])
      if user
        if user.authenticate(params[:password])
          payload = { user_id: user.id, email: user.email }
          auth_token = generate_auth_token(payload)
          render json: { id: user.id, email: user.email, auth_token: auth_token, message: 'User is authenticated successfully'}, status: 200
        else
          raise "Password is incorrect"
        end
      else
        raise "This email is not found"
      end
    rescue StandardError => e
      render json: { error: e.to_s }, status: 400
    end
  end
end
