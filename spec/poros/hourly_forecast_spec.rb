require 'rails_helper'

RSpec.describe HourlyForecast do
  it 'exists' do
    hourly_forecast_data =
                        {:dt=>1654462800,
                        :temp=>81.81,
                        :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}

    hourly_forecast_object = HourlyForecast.new(hourly_forecast_data)

    expect(hourly_forecast_object).to be_a(HourlyForecast)
  end

  it 'has attributes' do
    hourly_forecast_data =
                        {:dt=>1654462800,
                        :temp=>81.81,
                        :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}

    hourly_forecast_object = HourlyForecast.new(hourly_forecast_data)

    expect(hourly_forecast_object.time).to eq(Time.at(hourly_forecast_data[:dt]).strftime("%H:%M:%S"))
    expect(hourly_forecast_object.temperature).to eq(81.81)
    expect(hourly_forecast_object.conditions).to eq("few clouds")
    expect(hourly_forecast_object.icon).to eq("02d")
  end
end
