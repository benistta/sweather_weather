class ForecastFacade
  class << self
    def get_forecast(location)
      weather = ForecastService.get_all_forecast(location)
      # require "pry"; binding.pry

      current_forecast = CurrentForecast.new(weather[:current])
      daily_forecast = find_daily_forecast(weather[:daily])
      hourly_forecast = find_hourly_forecast(weather[:hourly])

      [current_forecast, daily_forecast, hourly_forecast]
      # require "pry"; binding.pry
    end

    def find_daily_forecast(weather)
      weather[0..4].map do |daily_weather|
        DailyForecast.new(daily_weather)
      end
    end

    def find_hourly_forecast(weather)
      weather[0..7].map do |hourly_weather|
        HourlyForecast.new(hourly_weather)
      end
    end
  end
end
