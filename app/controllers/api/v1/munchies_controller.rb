# class Api::V1::MunchiesController < ApplicationController
#   def index
#     # require "pry"; binding.pry
#     # destination_city = "pueblo,co"
#     forecast = ForecastFacade.get_forecast(params[:location])[0]
#     restaurant = YelpFacade.get_restaurant(params[:location], params[:food])
#     # restaurant = YelpFacade.get_restaurant(params[:location], params[:food])
# # require "pry"; binding.pry
#     # require "pry"; binding.pry
#     munchie_poro = Munchie.new(params[:location], forecast, restaurant)
#     # require "pry"; binding.pry
#     render json: Api::V1::MunchiesSerializer.new(munchie_poro)
#   end
# end
