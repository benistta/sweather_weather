class Api::V1::UsersController < ApplicationController
  def create
    # require "pry"; binding.pry
    user = User.new(user_params)
    if User.find_by(email: params[:email])
      render json: { data: { message: 'Invalid Email' } }, status: 401
    elsif params[:password] != params[:password_confirmation]
      render json: { data: { message: 'Invalid Password' } }, status: 401
    elsif params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: { error: "please fill all fields"}, status: :bad_request
    elsif user.save
      render json: Api::V1::UsersSerializer.formated_data(user), status: 201
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
