class YelpFacade
  class << self
    def get_restaurant(food, location, destination_city)
      json = YelpService.find_restaurant(food, location, destination_city)
      # require "pry"; binding.pry
      yelp_poro = Yelp.new(json[:businesses][1])
    end
  end
end
