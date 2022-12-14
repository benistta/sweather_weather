# require "rails_helper"
#
# RSpec.describe Yelp do
#   it 'exists' do
#     yelp_data = {:id=>"Yb4iTpZ3SjSEenqY6XMbFA",
#                 :alias=>"taste-of-china-denver",
#                 :name=>"Taste of China",
#                 :image_url=>"https://s3-media3.fl.yelpcdn.com/bphoto/jeBKUZqU9TxsDp4Y5HnHFg/o.jpg",
#                 :is_closed=>false,
#                 :url=>
#                  "https://www.yelp.com/biz/taste-of-china-denver?adjust_creative=_6dtP-lYAA4QXqo65J2ihg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=_6dtP-lYAA4QXqo65J2ihg",
#                 :review_count=>150,
#                 :categories=>[{:alias=>"chinese", :title=>"Chinese"}, {:alias=>"thai", :title=>"Thai"}, {:alias=>"asianfusion", :title=>"Asian Fusion"}],
#                 :rating=>4.5,
#                 :coordinates=>{:latitude=>39.74702, :longitude=>-105.02571},
#                 :transactions=>["delivery", "pickup"],
#                 :price=>"$$",
#                 :location=>
#                  {:address1=>"1935 Federal Blvd",
#                   :address2=>"",
#                   :address3=>nil,
#                   :city=>"Denver",
#                   :zip_code=>"80204",
#                   :country=>"US",
#                   :state=>"CO",
#                   :display_address=>["1935 Federal Blvd", "Denver, CO 80204"]},
#                 :phone=>"+13034772204",
#                 :display_phone=>"(303) 477-2204",
#                 :distance=>4901.717617542795}
#
#     # yelp_object = Yelp.new(yelp_data)
#     # require "pry"; binding.pry
#     # expect(yelp_object).to be_a(Yelp)
#     #
#     # expect(yelp_object.name).to eq("Taste of China")
#     # expect(yelp_object.address).to eq("1935 Federal Blvd", "Denver, CO 80204")
#     #
#     # expect(yelp_object).to_not eq('italian')
#     # expect(yelp_object).to_not eq('123 rd denver, co')
#   end
# end
