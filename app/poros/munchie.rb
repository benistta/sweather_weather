# class Munchie
#   attr_reader :id,
#               :destination_city,
#               :forecast,
#               :restaurant
#
#   def initialize(location, forecast, restaurant)
#     @id = nil
#     @destination_city = location
#     @forecast = {
#             summary: forecast.conditions,
#             temperature: forecast.temperature
#             # temperature: data[:current][:temp],
#             # summary: data[:current][:weather].first[:description]
#         }
#     @restaurant = {
#             name: restaurant.name,
#             address: restaurant.address
#           }
#     # require "pry"; binding.pry
#   end
# end
