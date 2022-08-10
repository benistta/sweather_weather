require 'rails_helper'

RSpec.describe 'users request' do
  it 'returns a succesful response' do
    data = {
      "email": "yo@test.com",
      "password": "hola",
      "password_confirmation": "hola"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'returns error if email is already used' do
    user = User.create!(email: "yo@test.com", password: "hola", password_confirmation: "hola")

   headers = { 'Content-Type': 'application/json' }
   params = {
     "email": "yo@test.com",
     "password": "hola",
     "password_confirmation": "hola"
   }
   post '/api/v1/users', headers: headers, params: JSON.generate(params)

   invalid = JSON.parse(response.body, symbolize_names: true)

   expect(response).to have_http_status(401)
   expect(invalid[:data][:message]).to eq('Invalid Email')
  end

  it 'returns error if invalid authentication' do
   headers = { 'Content-Type': 'application/json' }
   params = {
     "email": "yo@test.com",
     "password": "hola",
     "password_confirmation": "hi"
   }
   post '/api/v1/users', headers: headers, params: JSON.generate(params)

   invalid = JSON.parse(response.body, symbolize_names: true)

   expect(response).to have_http_status(401)
   expect(invalid[:data][:message]).to eq('Invalid Password')
  end
end
