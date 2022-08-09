class Api::V1::RoadTripController < ApplicationController
  def create
    # require "pry"; binding.pry
    road_trip = RoadTripFacade.find_roadtrip(params[:origin], params[:destination])
  end
end
