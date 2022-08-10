require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'returns current forecast', :vcr do
    current = ForecastFacade.get_forecast('denver,co')
    # require "pry"; binding.pry
    expect(current).to be_a(Array)
    expect(current[0]).to be_a(CurrentForecast)
    expect(current[0].conditions).to be_a(String)
    expect(current[0].datetime).to be_a(String)
    expect(current[0].feels_like).to be_a(Numeric)
    expect(current[0].humidity).to be_a(Numeric)
    expect(current[0].icon).to be_a(String)
    expect(current[0].sunrise).to be_a(String)
    expect(current[0].sunset).to be_a(String)
    expect(current[0].temperature).to be_a(Numeric)
    expect(current[0].uvi).to be_a(Numeric)
    expect(current[0].visibility).to be_a(Numeric)
  end

  it 'returns daily forecast', :vcr do
    weather = ForecastService.get_all_forecast('denver,co')
    daily = ForecastFacade.find_daily_forecast(weather[:daily])
    # require "pry"; binding.pry
    expect(weather).to be_a(Hash)
    expect(daily).to be_an(Array)
    expect(daily.count).to eq(5)
    daily.each do |day|
      expect(day).to be_a(DailyForecast)
    end
    expect(daily[0]).to be_a(DailyForecast)
    expect(daily[0].conditions).to be_a(String)
    expect(daily[0].date).to be_a(String)
    expect(daily[0].icon).to be_a(String)
    expect(daily[0].max_temp).to be_a(Numeric)
    expect(daily[0].min_temp).to be_a(Numeric)
    expect(daily[0].sunrise).to be_a(String)
    expect(daily[0].sunset).to be_a(String)
  end

  it 'returns hourly forecast', :vcr do
    weather = ForecastService.get_all_forecast('denver,co')
    hourly = ForecastFacade.find_hourly_forecast(weather[:hourly])
    # require "pry"; binding.pry
    expect(weather).to be_a(Hash)
    expect(hourly).to be_an(Array)
    expect(hourly.count).to eq(8)
    hourly.each do |hour|
      expect(hour).to be_a(HourlyForecast)
    end
    expect(hourly[0].conditions).to eq("clear sky")
    expect(hourly[0].conditions).to be_a(String)
    expect(hourly[0].icon).to eq("01d")
    expect(hourly[0].icon).to be_a(String)
    expect(hourly[0].temperature).to eq(78.6)
    expect(hourly[0].temperature).to be_a(Numeric)
    expect(hourly[0].time).to eq("20:00:00")
    expect(hourly[0].time).to be_a(String)
  end
end
