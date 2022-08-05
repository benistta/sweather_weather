class Mapquest
  attr_reader :latitude,
              :longitude

  def initialize(data)
    # require "pry"; binding.pry
    @latitude = data[:locations].first[:latLng][:lat]
    @longitude = data[:locations].first[:latLng][:lng]
    # require "pry"; binding.pry
  end
end
