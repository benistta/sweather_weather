class Api::V1::MunchiesController < ApplicationController
  def index
    # require "pry"; binding.pry
    location = MunchiesFacade.find_location(params[:location], params[:food])
  end
end
