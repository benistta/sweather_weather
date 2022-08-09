class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      render json: Api::V1::UsersSerializer.formated_data(user)
    else
      bad_credentials
    end
  end

private
  def bad_credentials
    render json: { data: { message: 'Credentials are invalid' } }, status: 401
  end
end
