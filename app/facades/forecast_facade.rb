class ForecastFacade
  class << self
    def get_forecast(location)
      json = ForecastService.get_all_forecast(location)
      # require "pry"; binding.pry
      json[:results].map do |result|
        Mapquest.new(result)
      end
    end
  end
end
