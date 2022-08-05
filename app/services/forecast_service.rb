class ForecastService
  class << self
    def get_all_forecast(location)
    end_point = "/geocoding/v1/address"
      response = mapquest_connection.get(end_point) do |faraday|
        faraday.params['key'] = ENV["MAPQUEST_API_KEY"]
        faraday.params["location"] = location
      end
      json = JSON.parse(response.body, symbolize_names: true)
      require "pry"; binding.pry
    end

    def mapquest_connection
      url = "http://www.mapquestapi.com"
      Faraday.new(url: url)
    end
  end
end
