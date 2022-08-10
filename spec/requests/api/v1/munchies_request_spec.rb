# require 'rails_helper'
#
# RSpec.describe "Munchies API" do
#   it "has a successful response", :vcr do
#
#     get '/api/v1/munchies?location=denver,co&food=chinese'
#
#     expect(response).to be_successful
#     expect(response).to have_http_status(200)
#     expect(response).to have_http_status(:ok)
#
#     body = JSON.parse(response.body, symbolize_names: true)
#     # require "pry"; binding.pry
#     expect(body).to have_key(:data)
#     # expect(body[:data]).to have_key
#
#     # expect(response[:data]).to have_key
#     expect(body[:data]).to have_key(:id)
#     expect(body[:data][:id]).to eq(nil)
#
#     expect(body[:data]).to have_key(:type)
#     expect(body[:data][:type]).to eq('munchies')
#     expect(body[:data][:attributes].keys).to include(:destination_city, :forecast, :restaurant)
#
#     expect(body[:data][:attributes][:forecast]).to have_key(:summary)
#     expect(body[:data][:attributes][:forecast]).to have_key(:temperature)
#
#     expect(body[:data][:attributes][:restaurant]).to have_key(:name)
#     expect(body[:data][:attributes][:restaurant]).to have_key(:address)
#   end
# end
