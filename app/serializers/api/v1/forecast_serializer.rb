# class ForecastSerializer
#   include JSONAPI::Serializer
#   set_id :id
#   set_type :forecast
#   attributes :current_weather, :hourly_weather, :daily_weather
# end
class Api::V1::ForecastSerializer
  class << self
    def forecast_index(current_forecast, daily_forecasts, hourly_forecasts)
      # require "pry"; binding.pry
      {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            datetime: current_forecast.datetime,
            sunrise: current_forecast.sunrise,
            sunset: current_forecast.sunset,
            temperature: current_forecast.temperature,
            feels_like: current_forecast.feels_like,
            humidity: current_forecast.humidity,
            uvi: current_forecast.uvi,
            visibility: current_forecast.visibility,
            conditions: current_forecast.conditions,
            icon: current_forecast.icon,

          },
          daily_weather: daily_forecasts.map do |daily_forecast|
            {
              date: daily_forecast.date,
              sunrise: daily_forecast.sunrise,
              sunset: daily_forecast.sunset,
              max_temp: daily_forecast.max_temp,
              min_temp: daily_forecast.min_temp,
              conditions: daily_forecast.conditions,
              icon: daily_forecast.icon,

            }
          end,
          hourly_weather: hourly_forecasts.map do |hourly_forecast|
            {
              time: hourly_forecast.time,
              temperature: hourly_forecast.temperature,
              conditions: hourly_forecast.conditions,
              icon: hourly_forecast.icon,

        }

      end
      }
    }
  }
    end
  end
end
