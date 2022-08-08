class Api::V1::MunchiesController < ApplicationController
  def index
    # require "pry"; binding.pry
    destination_city = "pueblo,co"
    restaurant = YelpFacade.get_restaurant(params[:food], location, destination_city)
    # restaurant = YelpFacade.get_restaurant(params[:location], params[:food])
# require "pry"; binding.pry
  end
end
