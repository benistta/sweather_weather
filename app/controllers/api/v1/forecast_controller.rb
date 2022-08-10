class Api::V1::ForecastController < ApplicationController
  before_action :params_missing
  def index
    forecast = ForecastFacade.get_forecast(params[:location])
    render json: Api::V1::ForecastSerializer.forecast_index(forecast[0], forecast[1], forecast[2])
  end

  private

  def params_missing
    if params[:location].nil? || params[:location].empty?
      render json: { data: { message: ':location param missing' } }, status: 404
    end
  end
end
