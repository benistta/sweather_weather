class YelpService < BaseService
  class << self
    def find_restaurant(food, location, destination_city)
    end_point = "/v3/businesses/search"
    #how to get the params in services
    # term = params[:food]
    # destination = params[:destination]
      response_yelp = connection_yelp.get(end_point) do |faraday|
        faraday.headers['Authorization'] = "Bearer #{ENV["YELP_API_KEY"]}"
        faraday.params["term"] = food
        faraday.params["location"] = destination_city
    end
    parsed_yelp = JSON.parse(response_yelp.body, symbolize_names: true)
    # require "pry"; binding.pry
    end
  end
end
