class HourlyForecast
  attr_reader :time,
              :temperature,
              :conditions,
              :icon


  def initialize(data)
    # require "pry"; binding.pry
    @time = Time.at(data[:dt]).strftime("%H:%M:%S")
    @temperature = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
# require "pry"; binding.pry
  end
end
# time, in a human-readable format such as “14:00:00”
# temperature, floating point number indicating the current temperature in Fahrenheit
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather
