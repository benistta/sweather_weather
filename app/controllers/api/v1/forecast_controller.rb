class Api::V1::ForecastController < ApplicationController
  def index
    # require "pry"; binding.pry
    forecast = ForecastFacade.get_forecast(params[:location])
    # require "pry"; binding.pry
    render json: Api::V1::ForecastSerializer.forecast_index(forecast[0], forecast[1], forecast[2])
    # render json: ForescastSerializer.new(all_weather)
    # require "pry"; binding.pry
  end
end
