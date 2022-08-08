class Api::V1::MunchiesController < ApplicationController
  def index
    # require "pry"; binding.pry
    destination_city = "pueblo,co"
    restaurant = YelpFacade.get_restaurant(params[:food], location, destination_city)
    # restaurant = YelpFacade.get_restaurant(params[:location], params[:food])
# require "pry"; binding.pry
    forecast = ForecastFacade.get_forecast(destination_city)[0]
    # require "pry"; binding.pry
    munchie_poro = Munchie.new(destination_city, restaurant, forecast)
    # require "pry"; binding.pry
    render json: Api::V1::MunchiesSerializer.new(munchie_poro)
  end
end
