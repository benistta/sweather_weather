class Api::V1::UsersController < ApplicationController

  def create
    # require "pry"; binding.pry
    user = User.create!(user_params)
    render json: UsersSerializer.new(user), status: 201
  end
#chequear bcryt y hasta que punto chequeean la verificacion de passwords. Does bcrypt takes care of password confirmation automatically

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
