require "rails_helper"

RSpec.describe Yelp do
  it 'exists', :vcr do
    yelp_data = {:id=>"kQxM1xlaZfQmXpKaqMTNnw",
                :alias=>"wonderful-bistro-pueblo",
                :name=>"Wonderful Bistro",
                :image_url=>"https://s3-media1.fl.yelpcdn.com/bphoto/HqKiK_Ju61fC4nSFq_fgHg/o.jpg",
                :is_closed=>false,
                :url=>
                "https://www.yelp.com/biz/wonderful-bistro-pueblo?adjust_creative=_6dtP-lYAA4QXqo65J2ihg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=_6dtP-lYAA4QXqo65J2ihg",
                :review_count=>76,
                :categories=>[{:alias=>"chinese", :title=>"Chinese"}],
                :rating=>4.0,
                :coordinates=>{:latitude=>38.319366, :longitude=>-104.616623},
                :transactions=>["delivery"],
                :price=>"$$",
                :location=>
                {:address1=>"4602 N Elizabeth St",
                 :address2=>"Ste 120",
                 :address3=>"",
                 :city=>"Pueblo",
                 :zip_code=>"81008",
                 :country=>"US",
                 :state=>"CO",
                 :display_address=>["4602 N Elizabeth St", "Ste 120", "Pueblo, CO 81008"]},
                :phone=>"+17195440233",
                :display_phone=>"(719) 544-0233",
                :distance=>6632.28027227077
                }

    yelp_object = Yelp.new(yelp_data)
    expect(yelp_object).to be_a(Yelp)
    # require "pry"; binding.pry

    expect(yelp_object.name).to eq("Wonderful Bistro")
    expect(yelp_object.address).to eq("4602 N Elizabeth St, Ste 120, Pueblo, CO 81008")

    expect(yelp_object).to_not eq('italian')
    expect(yelp_object).to_not eq('123 rd denver, co')
  end
end
