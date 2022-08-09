require 'rails_helper'

RSpec.describe YelpFacade do
  it 'returns restaurant', :vcr do
    yelp_object = YelpFacade.get_restaurant('denver,co', 'chinese')
    # require "pry"; binding.pry

    expect(yelp_object.name).to be_a(String)
    expect(yelp_object.name).to eq("Taste of China")
    expect(yelp_object.address).to be_a(String)
    expect(yelp_object.address).to eq("1935 Federal Blvd Denver, CO 80204")

    expect(yelp_object.name).to_not be_a(Numeric)
    expect(yelp_object.name).to_not eq("345 s pearl")

  end
end
