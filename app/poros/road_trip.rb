class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :destination_temperature,
              :destination_conditions

  def initialize(data, origin, destination)

    @start_city = "#{data[:route][:locations][0][:adminArea5]}, #{data[:route][:locations][0][:adminArea3]}"
    @end_city = "#{data[:route][:locations][1][:adminArea5]}, #{data[:route][:locations][1][:adminArea3]}"
    @travel_time = formatted_travel_time(data)
    @destination_temperature = temperature(data, destination)
    @destination_conditions = conditions(data, destination)
  end

  def formatted_travel_time(data)
    if data.nil?
      return "imposible trip"
    else data.present?
      formatted = data[:route][:formattedTime].split(":")[0].to_i.to_s + " " +  "hours" + ", " + data[:route][:formattedTime].split(":")[1].to_i.to_s + " " + "minutes"
      # require "pry"; binding.pry
    end
  end
  # def formatted_travel_time(data)
  #   if data.nil?
  #     return "imposible trip"
  #   else data.present?
  #     if data[:route][:formattedTime].split(":")[0].to_i > 48 && data[:route][:formattedTime].split(":")[0].to_i < 81
  #       (data[:route][:formattedTime].split(":")[0].to_i.to_s + " " +  "hours" + ", " + data[:route][:formattedTime].split(":")[1].to_i.to_s + " " + "minutes").to_i.divmod(24)[0].day
  #       # require "pry"; binding.pry
  #     else
  #       data[:route][:formattedTime].split(":")[0].to_i.to_s + " " +  "hours" + ", " + data[:route][:formattedTime].split(":")[1].to_i.to_s + " " + "minutes"
  #   end
  #   end
  # end

  def temperature(data, destination)
      #is there a max of hours?
    if @travel_time.to_i > 48 && @travel_time.to_i < 81
      #confirmed we get an error if the travel time is more than the maximun return number of 48
      forecast = ForecastService.get_all_forecast(destination)
      formatted_travel_time(data)
      # formatted_travel_time(data).to_i.divmod(24)[0].day
      forecast[:daily][3][:temp][:day]
      # require "pry"; binding.pry
    elsif
      forecast = ForecastService.get_all_forecast(destination)
      formatted_travel_time(data)
      # formatted_travel_time(data).to_i.divmod(24)[0].day
      # require "pry"; binding.pry
      forecast[:hourly][formatted_travel_time(data).to_i][:temp]
    elsif @travel_time == "impossible trip"
        return "impossible trip"
     end
   end

  def conditions(data, destination)
    if @travel_time.to_i > 48 && @travel_time.to_i < 81
      forecast = ForecastService.get_all_forecast(destination)
      # require "pry"; binding.pry
      forecast[:daily][3][:weather][0][:description]
    elsif
      forecast = ForecastService.get_all_forecast(destination)
      if forecast[:hourly][@travel_time.to_i][:weather][0][:description].present?
        forecast[:hourly][@travel_time.to_i][:weather][0][:description]
      elsif @travel_time == "impossible trip"
        return "impossible trip"
      end
    end
  end
end
