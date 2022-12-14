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
