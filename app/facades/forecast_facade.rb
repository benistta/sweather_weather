class ForecastFacade
  class << self
    def get_forecast(location)
      all_weather = ForecastService.get_all_forecast(location)
      # require "pry"; binding.pry

      
    end
  end
end
