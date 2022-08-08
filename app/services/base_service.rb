class BaseService
  class << self
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
