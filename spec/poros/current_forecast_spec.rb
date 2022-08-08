require "rails_helper"

RSpec.describe CurrentForecast do
  it 'exists' do
    forecast_data =
                  {:dt=>1654463330,
                   :sunrise=>1654428764,
                   :sunset=>1654482269,
                   :temp=>81.81,
                   :feels_like=>79.93,
                   :humidity=>24,
                   :uvi=>5.7,
                   :visibility=>10000,
                   :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}

    current_forecast_object = CurrentForecast.new(forecast_data)
    # require "pry"; binding.pry
    expect(current_forecast_object).to be_a(CurrentForecast)
  end

  it 'has attributes' do
    forecast_data =
                  {:dt=>1654463330,
                   :sunrise=>1654428764,
                   :sunset=>1654482269,
                   :temp=>81.81,
                   :feels_like=>79.93,
                   :humidity=>24,
                   :uvi=>5.7,
                   :visibility=>10000,
                   :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}

    current_forecast_object = CurrentForecast.new(forecast_data)
    # require "pry"; binding.pry
    expect(current_forecast_object.datetime).to eq(Time.at(forecast_data[:dt]).to_s)
    expect(current_forecast_object.sunrise).to eq(Time.at(forecast_data[:sunrise]).to_s)
    expect(current_forecast_object.sunset).to eq(Time.at(forecast_data[:sunset]).to_s)
    expect(current_forecast_object.temperature).to eq(81.81)
    expect(current_forecast_object.feels_like).to eq(79.93)
    expect(current_forecast_object.humidity).to eq(24)
    expect(current_forecast_object.uvi).to eq(5.7)
    expect(current_forecast_object.visibility).to eq(10000)
    expect(current_forecast_object.conditions).to eq("few clouds")
    expect(current_forecast_object.icon).to eq("02d")
  end
end
