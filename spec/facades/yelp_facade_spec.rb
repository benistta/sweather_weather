require 'rails_helper'

RSpec.describe YelpFacade do
  it 'returns restaurant', :vcr do
    yelp_object = YelpFacade.get_restaurant('chinese','denver,co', 'pueblo,co')
    # require "pry"; binding.pry

    expect(yelp_object.name).to be_a(String)
    expect(yelp_object.name).to eq("Wonderful Bistro")
    expect(yelp_object.address).to be_a(String)
    expect(yelp_object.address).to eq("4602 N Elizabeth St, Ste 120, Pueblo, CO 81008")

    expect(yelp_object.name).to_not be_a(Numeric)
    expect(yelp_object.name).to_not eq("Italian")

  end
end
