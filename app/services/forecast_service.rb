class ForecastService
  class << self
    def get_all_forecast(location)
    end_point = "/geocoding/v1/address"
      response = connection_mapquest.get(end_point) do |faraday|
        faraday.params['key'] = ENV["MAPQUEST_API_KEY"]
        faraday.params["location"] = location
      end
      json = JSON.parse(response.body, symbolize_names: true)
      # require "pry"; binding.pry
      latitude = json[:results].first[:locations].first[:latLng][:lat]
      longitude = json[:results].first[:locations].first[:latLng][:lng]

      get_weather(latitude, longitude)
    end

    def get_weather(latitude, longitude)
    end_point = "/data/2.5/onecall"
      response = connection_openweather.get(end_point) do |faraday|
        faraday.params["appid"] = ENV["FORECAST_API_KEY"]
        faraday.params["lat"] = latitude
        faraday.params["lon"] = longitude
        faraday.params['units'] = 'imperial'

      end
      json = JSON.parse(response.body, symbolize_names: true)
      # require "pry"; binding.pry
    end

    def connection_mapquest
      url = "http://www.mapquestapi.com"
      Faraday.new(url: url)
    end

    def connection_openweather
      url = "https://api.openweathermap.org"
      Faraday.new(url: url)
    end
  end
end
