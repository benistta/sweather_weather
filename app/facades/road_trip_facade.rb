class RoadTripFacade
  class << self
  def find_roadtrip(origin, destination)
    data = ForecastService.get_roadtrip(origin, destination)
        if data[:route][:formattedTime].present?
          RoadTrip.new(data, origin, destination)
        elsif data[:route][:formattedTime].nil?
          return "impossible trip"
        end
      end
    end
  end
