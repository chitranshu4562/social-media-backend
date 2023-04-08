class Api::V1::UsersController < ApplicationController
  def user_signup
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      auth_token = generate_auth_token(email: user.email)
      render json: { data: user, auth_token: auth_token, message: 'User is created successfully'}, status: 200
    else
      render json: { message: user.errors.full_messages}, status: 400
    end
  end
end
