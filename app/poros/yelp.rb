class Yelp
  attr_reader :name,
              :address

  def initialize(data)
     # require "pry"; binding.pry
    @name = data[0][:name]
    @address = full_address(data)
    # @address = data[0][:display_address]
    # require "pry"; binding.pry
  end
    def full_address(data)
      data[0][:location][:address1] + " " + data[0][:location][:city] + ", "  +  data[0][:location][:state]  + " " + data[0][:location][:zip_code]
  end
end
