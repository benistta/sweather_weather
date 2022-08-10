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
