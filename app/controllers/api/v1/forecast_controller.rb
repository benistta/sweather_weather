class Api::V1::ForecastController < ApplicationController
  def index
    # require "pry"; binding.pry
    @forecast = ForecastFacade.get_forecast(params[:location])
    # require "pry"; binding.pry
  end
end
