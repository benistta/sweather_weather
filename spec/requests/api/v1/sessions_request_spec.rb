require 'rails_helper'
RSpec.describe 'login' do
  it 'returns a response' do
    user_1 = User.create!(email: "yo@test.com", password: "hola", password_confirmation: "hola")

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    params = {
      "email": "yo@test.com",
      "password": "hola"
    }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'returns error if bad authentication' do
    user = User.create!(email: "yo@test.com", password: "hola", password_confirmation: "hola")

    headers = { 'Content-Type': 'application/json' }
    params = {
      "email": "yo@test.com",
      "password": "hi"
    }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

    invalid = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(401)
    expect(invalid[:data][:message]).to eq('Credentials are invalid')
  end
end
