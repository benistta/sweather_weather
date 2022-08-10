require 'rails_helper'
#el base service se testea?
RSpec.describe ForecastService do
  before :each do
    @forecast = ForecastService.get_all_forecast('denver,co')
  end

  it 'returns  current forecast data', :vcr do
    expect(@forecast).to be_a(Hash)
    expect(@forecast).to have_key(:lat)
    expect(@forecast).to_not have_key(:minute)
    expect(@forecast).to have_key(:current)
    expect(@forecast[:current]).to be_a(Hash)

    expect(@forecast[:current]).to have_key(:dt)
    expect(@forecast[:current][:dt]).to be_an(Integer)

    expect(@forecast[:current]).to have_key(:sunrise)
    expect(@forecast[:current][:sunrise]).to be_an(Integer)

    expect(@forecast[:current]).to have_key(:sunset)
    expect(@forecast[:current][:sunset]).to be_an(Integer)

    expect(@forecast[:current]).to have_key(:temp)
    expect(@forecast[:current][:temp]).to be_a(Float)

    expect(@forecast[:current]).to have_key(:feels_like)
    expect(@forecast[:current][:feels_like]).to be_a(Float)

    expect(@forecast[:current]).to have_key(:pressure)
    expect(@forecast[:current][:pressure]).to be_an(Integer)

    expect(@forecast[:current]).to have_key(:humidity)
    expect(@forecast[:current][:humidity]).to be_an(Integer)

    expect(@forecast[:current]).to have_key(:dew_point)
    expect(@forecast[:current][:dew_point]).to be_a(Float)

    expect(@forecast[:current]).to have_key(:uvi)
    expect(@forecast[:current][:uvi]).to be_an(Numeric)

    expect(@forecast[:current]).to have_key(:clouds)
    expect(@forecast[:current][:clouds]).to be_an(Integer)

    expect(@forecast[:current]).to have_key(:visibility)
    expect(@forecast[:current][:visibility]).to be_an(Integer)

    expect(@forecast[:current]).to have_key(:wind_speed)
    expect(@forecast[:current][:wind_speed]).to be_a(Numeric)
    #
    expect(@forecast[:current]).to have_key(:wind_deg)
    expect(@forecast[:current][:wind_deg]).to be_an(Integer)

    expect(@forecast[:current]).to have_key(:wind_gust)
    expect(@forecast[:current][:wind_gust]).to be_a(Numeric)
    expect(@forecast[:current][:wind_gust]).to be_an(Numeric)

    expect(@forecast[:current][:weather][0]).to have_key(:id)
    expect(@forecast[:current][:weather][0][:id]).to be_an(Integer)

    expect(@forecast[:current][:weather][0]).to have_key(:main)
    expect(@forecast[:current][:weather][0][:main]).to be_an(String)

    expect(@forecast[:current]).to have_key(:weather)
    expect(@forecast[:current][:weather]).to be_a(Array)

    expect(@forecast[:current][:weather][0]).to have_key(:description)
    expect(@forecast[:current][:weather][0][:description]).to be_a(String)

    expect(@forecast[:current][:weather][0]).to have_key(:icon)
    expect(@forecast[:current][:weather][0][:icon]).to be_an(String)
end
  it 'returns daily forecast data', :vcr do
    @forecast[:daily].shift(5).each do |day|
      expect(day).to have_key(:dt)
      expect(day[:dt]).to be_an(Integer)

      expect(day).to have_key(:sunrise)
      expect(day[:sunrise]).to be_an(Integer)

      expect(day).to have_key(:sunset)
      expect(day[:sunset]).to be_an(Integer)

      expect(day).to have_key(:moonrise)
      expect(day[:moonrise]).to be_an(Integer)

      expect(day).to have_key(:moonset)
      expect(day[:moonset]).to be_an(Integer)

      expect(day).to have_key(:moon_phase)
      expect(day[:moon_phase]).to be_a(Float)

      expect(day).to have_key(:temp)
      expect(day[:temp]).to be_a(Hash)

      expect(day[:temp]).to have_key(:day)
      expect(day[:temp][:day]).to be_a(Float)

      expect(day[:temp]).to have_key(:max)
      expect(day[:temp][:max]).to be_a(Numeric)

      expect(day[:temp]).to have_key(:min)
      expect(day[:temp][:min]).to be_an(Float)

      expect(day[:temp]).to have_key(:night)
      expect(day[:temp][:night]).to be_an(Float)

      expect(day[:temp]).to have_key(:eve)
      expect(day[:temp][:eve]).to be_an(Float)

      expect(day[:temp]).to have_key(:morn)
      expect(day[:temp][:morn]).to be_an(Float)

      expect(day).to have_key(:feels_like)
      expect(day[:feels_like]).to be_an(Hash)

      expect(day[:feels_like]).to have_key(:day)
      expect(day[:feels_like][:day]).to be_an(Numeric)

      expect(day[:feels_like]).to have_key(:night)
      expect(day[:feels_like][:night]).to be_an(Float)

      expect(day[:feels_like]).to have_key(:eve)
      expect(day[:feels_like][:eve]).to be_an(Float)

      expect(day[:feels_like]).to have_key(:morn)
      expect(day[:feels_like][:morn]).to be_an(Float)

      expect(day).to have_key(:pressure)
      expect(day[:pressure]).to be_an(Integer)

      expect(day).to have_key(:humidity)
      expect(day[:humidity]).to be_an(Integer)

      expect(day).to have_key(:dew_point)
      expect(day[:dew_point]).to be_an(Float)

      expect(day).to have_key(:wind_speed)
      expect(day[:wind_speed]).to be_an(Numeric)

      expect(day).to have_key(:wind_deg)
      expect(day[:wind_deg]).to be_an(Integer)

      expect(day).to have_key(:wind_gust)
      expect(day[:wind_gust]).to be_a(Float)

      expect(day).to have_key(:weather)
      expect(day[:weather]).to be_an(Array)

      expect(day[:weather][0]).to have_key(:id)
      expect(day[:weather][0][:id]).to be_an(Integer)

      expect(day[:weather][0]).to have_key(:main)
      expect(day[:weather][0][:main]).to be_a(String)

      expect(day[:weather][0]).to have_key(:description)
      expect(day[:weather][0][:description]).to be_a(String)

      expect(day[:weather][0]).to have_key(:icon)
      expect(day[:weather][0][:icon]).to be_a(String)
      # require "pry"; binding.pry
    end
  end

  it 'returns hourly forecast data', :vcr do
    @forecast[:hourly].shift(8).each do |hour|

     expect(hour).to have_key(:dt)
     expect(hour[:dt]).to be_an(Integer)

     expect(hour).to have_key(:temp)
     expect(hour[:temp]).to be_an(Float)

     expect(hour).to have_key(:feels_like)
     expect(hour[:feels_like]).to be_an(Float)

     expect(hour).to have_key(:pressure)
     expect(hour[:pressure]).to be_an(Integer)

     expect(hour).to have_key(:humidity)
     expect(hour[:humidity]).to be_an(Integer)

     expect(hour).to have_key(:dew_point)
     expect(hour[:dew_point]).to be_an(Float)

     expect(hour).to have_key(:uvi)
     expect(hour[:uvi]).to be_an(Numeric)

     expect(hour).to have_key(:clouds)
     expect(hour[:clouds]).to be_an(Numeric)

     expect(hour).to have_key(:visibility)
     expect(hour[:visibility]).to be_an(Numeric)

     expect(hour).to have_key(:wind_speed)
     expect(hour[:wind_speed]).to be_an(Numeric)

     expect(hour).to have_key(:wind_deg)
     expect(hour[:wind_deg]).to be_an(Integer)

     expect(hour).to have_key(:wind_gust)
     expect(hour[:wind_gust]).to be_a(Float)

     expect(hour).to have_key(:weather)
     expect(hour[:weather]).to be_an(Array)

     expect(hour[:weather][0]).to have_key(:id)
     expect(hour[:weather][0][:id]).to be_an(Integer)

     expect(hour[:weather][0]).to have_key(:main)
     expect(hour[:weather][0][:main]).to be_a(String)

     expect(hour[:weather][0]).to have_key(:description)
     expect(hour[:weather][0][:description]).to be_a(String)

     expect(hour[:weather][0]).to have_key(:icon)
     expect(hour[:weather][0][:icon]).to be_a(String)

     expect(hour).to have_key(:pop)
     expect(hour[:pop]).to be_a(Numeric)
    end
  end
    it 'finds road trip details', :vcr do
    route = ForecastService.get_roadtrip('denver,co', 'pueblo,co')

    expect(route).to be_a(Hash)

    expect(route).to have_key(:route)
    expect(route).to be_a(Hash)

    expect(route[:route]).to have_key(:formattedTime)
    expect(route[:route][:formattedTime]).to be_a(String)

    expect(route[:route]).to have_key(:sessionId)
    expect(route[:route][:sessionId]).to be_a(String)

    expect(route[:route]).to have_key(:distance)
    expect(route[:route][:distance]).to be_a(Float)
  end
end
