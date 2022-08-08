require 'rails_helper'

RSpec.describe "Munchies API" do
  it "", :vcr do

    get '/api/v1/munchies?location=denver,co&food=chinese'
#complete el request test. Para el serializer
    expect(response).to be_successful
    expect(response).to have_http_status(200)
    expect(response).to have_http_status(:ok)

    body = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    expect(body).to have_key(:data)
    # expect(body[:data]).to have_key


    # expect(response[:data]).to have_key
  end
end
