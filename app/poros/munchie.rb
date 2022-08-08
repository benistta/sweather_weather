class Munchie
  attr_reader :id,
              :destination_city,
              :forecast,
              :restaurant

  def initialize(destination_city, restaurant, forecast)
    @id = nil
    @destination_city = destination_city
    @forecast = forecast.forecast
    @restaurant = restaurant.restaurant
    # require "pry"; binding.pry
  end
end
