class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      roadtrip = RoadTripFacade.find_roadtrip(params[:origin], params[:destination])
        if roadtrip == "impossible trip"
          bad_credentials_roadtrip
        else
          render json: Api::V1::RoadTripSerializer.roadtrip(params[:origin], params[:destination], roadtrip)
        end
    elsif user.nil?
      bad_credentials
    end
  end

  private
    def bad_credentials
      render json: { message: "invalid api key" }, status: 401
    end

    def bad_credentials_roadtrip
      render json: { error: "Imposible Trip"}
    end
end
