class DailyForecast
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    # require "pry"; binding.pry
    @date = Time.at(data[:dt]).strftime("%m/%d/%Y")
    @sunrise = Time.at(data[:sunrise]).to_s
    @sunset = Time.at(data[:sunset]).to_s
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
# require "pry"; binding.pry
  end
end
# date, in a human-readable format such as “2020-09-30”
# sunrise, in a human-readable format such as “2020-09-30 06:27:03 -0600”
# sunset, in a human-readable format such as “2020-09-30 18:27:03 -0600”
# max_temp, floating point number indicating the maximum expected temperature in Fahrenheit
# min_temp, floating point number indicating the minimum expected temperature in Fahrenheit
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather
