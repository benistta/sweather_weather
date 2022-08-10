require 'rails_helper'

RSpec.describe 'Create a Road Trip endpoint' do
  describe 'happy path' do
    it 'returns data for a roadtrip', :vcr do
        api_key = ApiKey.create
        user = User.create!(email: "beck@test.com", password: "hola", password_confirmation: "hola", api_key: api_key.access_token)
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "origin"=>"Denver, CO",
             "destination"=>"Pueblo, CO",
             "api_key" => "#{api_key.access_token}"
          }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results.keys.count).to eq(1)
        expect(results[:data]).to be_a(Hash)
        expect(results[:data].keys.count).to eq(3)

        data = results[:data]
        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)

        expect(data).to have_key(:type)
        expect(data[:type]).to eq("roadtrip")

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)
        expect(data[:attributes].keys.count).to eq(4)

        attributes = data[:attributes]
        expect(attributes).to have_key(:start_city)
        expect(attributes[:start_city]).to be_a(String)

        expect(attributes).to have_key(:end_city)
        expect(attributes[:end_city]).to be_a(String)

        expect(attributes).to have_key(:travel_time)
        expect(attributes[:travel_time]).to be_a(String)

        expect(attributes).to have_key(:weather_at_eta)
        expect(attributes[:weather_at_eta]).to be_a(Hash)
        expect(attributes[:weather_at_eta].keys.count).to eq(2)

        weather = attributes[:weather_at_eta]
        expect(weather).to have_key(:temperature)
        expect(weather[:temperature]).to be_a(Numeric)

        expect(weather).to have_key(:conditions)
        expect(weather[:conditions]).to be_a(String)
      end
    end

    it 'returns data if route is "impossible"', :vcr do
        api_key = ApiKey.create
        user = User.create!(email: "beck@test.com", password: "hola", password_confirmation: "hola", api_key: api_key.access_token)
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "origin"=>"New York, NY",
             "destination"=>"London, UK",
             "api_key" => "#{api_key.access_token}"
          }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)

        data = results[:data]
        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)

        expect(data).to have_key(:type)
        expect(data[:type]).to eq("roadtrip")

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]
        expect(attributes).to have_key(:start_city)
        expect(attributes[:start_city]).to be_a(String)

        expect(attributes).to have_key(:end_city)
        expect(attributes[:end_city]).to be_a(String)

        expect(attributes).to have_key(:travel_time)
        expect(attributes[:travel_time]).to eq("Impossible Route")

        expect(attributes).to have_key(:weather_at_eta)
        expect(attributes[:weather_at_eta]).to be_a(Hash)

        weather = attributes[:weather_at_eta]
        expect(weather).to have_key(:temperature)
        expect(weather[:temperature]).to eq("")

        expect(weather).to have_key(:conditions)
        expect(weather[:conditions]).to eq("")
    end

    it 'returns data when origin and destination are not real places', :vcr do
        api_key = ApiKey.create
        user = User.create!(email: "beck@test.com", password: "hola", password_confirmation: "hola", api_key: api_key.access_token)
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "origin"=>"aqui",
             "destination"=>"alla",
             "api_key" => "#{api_key.access_token}"
          }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)

        data = results[:data]
        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)

        expect(data).to have_key(:type)
        expect(data[:type]).to eq("roadtrip")

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]
        expect(attributes).to have_key(:start_city)
        expect(attributes[:start_city]).to be_a(String)

        expect(attributes).to have_key(:end_city)
        expect(attributes[:end_city]).to be_a(String)

        expect(attributes).to have_key(:travel_time)
        expect(attributes[:travel_time]).to eq("Impossible Route")

        expect(attributes).to have_key(:weather_at_eta)
        expect(attributes[:weather_at_eta]).to be_a(Hash)

        weather = attributes[:weather_at_eta]
        expect(weather).to have_key(:temperature)
        expect(weather[:temperature]).to eq("")

        expect(weather).to have_key(:conditions)
        expect(weather[:conditions]).to eq("")
      end


  describe 'sad path/edge cases' do
    it 'returns an error if origin is missing', :vcr do
        api_key = ApiKey.create
        user = User.create!(email: "beck@test.com", password: "hola", password_confirmation: "hola", api_key: api_key.access_token)
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "origin"=>"",
             "destination"=>"La Paz,Bolivia",
             "api_key" => "#{api_key.access_token}"
          }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:status)
        expect(results[:status]).to eq("BAD REQUEST")

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Origin cannot be blank")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end

    it 'returns an error if destination is missing', :vcr do
        api_key = ApiKey.create
        user = User.create!(email: "beck@test.com", password: "hola", password_confirmation: "hola", api_key: api_key.access_token)
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "origin"=>"La Paz,Bolivia",
             "destination"=>"",
             "api_key" => "#{api_key.access_token}"
          }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:status)
        expect(results[:status]).to eq("BAD REQUEST")

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Destination cannot be blank")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end
    end

    it 'returns an error if there is no API key', :vcr do
        api_key = ApiKey.create
        user = User.create!(email: "beck@test.com", password: "hola", password_confirmation: "hola", api_key: api_key.access_token)
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "origin"=>"La Paz,Bolivia",
             "destination"=>"New York,NY",
             "api_key" => ""
          }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(401)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:status)
        expect(results[:status]).to eq("UNAUTHORIZED")

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})

    end

    it 'returns an error if API key does not match', :vcr do
        api_key = ApiKey.create
        user = User.create!(email: "beck@test.com", password: "hola", password_confirmation: "hola", api_key: api_key.access_token )
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "origin"=>"Denver, CO",
             "destination"=>"Pueblo, CO",
             "api_key" => "29jdbsiathisisbad"
          }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(401)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:status)
        expect(results[:status]).to eq("UNAUTHORIZED")

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
  end
end
