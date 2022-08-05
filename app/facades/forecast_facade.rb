class ForecastFacade
  class << self
    def get_forecast(location)
      ForecastService.get_all_forecast(location)
    end
  end
end
