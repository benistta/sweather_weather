# require "rails_helper"
#
# RSpec.describe Munchie do
#   it 'exists', :vcr do
#     destination_city = 'pueblo,co'
#     forecast = ForecastFacade.get_forecast(destination_city)[0]
#     restaurant = YelpFacade.get_restaurant('chinese','denver,co', destination_city)
#
#     # require "pry"; binding.pry
#     munchie_object = Munchie.new(destination_city, forecast, restaurant)
# require "pry"; binding.pry
#     ###########Aumentar sad paths
#     expect(munchie_object).to be_a(Munchie)
#
#     expect(munchie_object.forecast).to have_key(:temperature)
#     expect(munchie_object.forecast).to have_key(:summary)
#
#     expect(munchie_object.yelp.restaurant).to have_key(:name)
#     expect(munchie_object.yelp.restaurant).to have_key(:address)
#   end
# end
