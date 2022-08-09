class YelpFacade
  class << self
    def get_restaurant(location, food)
      json = YelpService.find_restaurant(location, food)
      # require "pry"; binding.pry
      yelp_poro = Yelp.new(json[:businesses])
      # yelp_poro = json[:businesses].map do |restaurant|
      #   Yelp.new(restaurant)
      # end
      # require "pry"; binding.pry
    end
  end
end
