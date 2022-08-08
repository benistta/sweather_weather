require 'rails_helper'

RSpec.describe DailyForecast do
  it 'exists' do
    daily_forecast_data =
                        {:dt=>1654452000,
                        :sunrise=>1654428764,
                        :sunset=>1654482269,
                        :temp=>{:day=>80.76, :min=>63.63, :max=>82.26, :night=>66.96, :eve=>76.8, :morn=>63.63},
                        :weather=>[{:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10d"}]}

    daily_forecast_object = DailyForecast.new(daily_forecast_data)

    expect(daily_forecast_object).to be_a(DailyForecast)
  end

  it 'has attributes' do
    daily_forecast_data =
                          {:dt=>1654452000,
                          :sunrise=>1654428764,
                          :sunset=>1654482269,
                          :temp=>{:day=>80.76, :min=>63.63, :max=>82.26, :night=>66.96, :eve=>76.8, :morn=>63.63},
                          :weather=>[{:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10d"}]}

    daily_forecast_object = DailyForecast.new(daily_forecast_data)

    expect(daily_forecast_object.date).to eq(Time.at(daily_forecast_data[:dt]).strftime("%m/%d/%Y"))
    expect(daily_forecast_object.sunrise).to eq(Time.at(daily_forecast_data[:sunrise]).to_s)
    expect(daily_forecast_object.sunset).to eq(Time.at(daily_forecast_data[:sunset]).to_s)
    expect(daily_forecast_object.max_temp).to eq(82.26)
    expect(daily_forecast_object.min_temp).to eq(63.63)
    expect(daily_forecast_object.conditions).to eq("light rain")
    expect(daily_forecast_object.icon).to eq("10d")
  end
end
