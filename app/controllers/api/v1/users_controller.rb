class Api::V1::UsersController < ApplicationController
  def user_signup
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      render json: { data: user, message: 'User is created successfully'}, status: 200
    else
      render json: { message: user.errors.full_messages}, status: 400
    end
  end
end
