require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists', :vcr do
    data = {:route => {
            :formattedTime=> "01:45:23",
            :locations=>[{:dragPoint=>false,
            :displayLatLng=>{:lng=>-104.984856, :lat=>39.738453},
            :adminArea4=>"Denver County",
            :adminArea5=>"Denver",
            :postalCode=>"",
            :adminArea1=>"US",
            :adminArea3=>"CO",
            :type=>"s",
            :sideOfStreet=>"N",
            :geocodeQualityCode=>"A5XAX",
            :adminArea4Type=>"County",
            :linkId=>42409351,
            :street=>"",
            :adminArea5Type=>"City",
            :geocodeQuality=>"CITY",
            :adminArea1Type=>"Country",
            :adminArea3Type=>"State",
            :latLng=>{:lng=>-104.984853, :lat=>39.738453}},
           {:dragPoint=>false,
            :displayLatLng=>{:lng=>-104.610413, :lat=>38.265427},
            :adminArea4=>"Pueblo County",
            :adminArea5=>"Pueblo",
            :postalCode=>"",
            :adminArea1=>"US",
            :adminArea3=>"CO",
            :type=>"s",
            :sideOfStreet=>"N",
            :geocodeQualityCode=>"A5XAX",
            :adminArea4Type=>"County",
            :linkId=>57644123,
            :street=>"",
            :adminArea5Type=>"City",
            :geocodeQuality=>"CITY",
            :adminArea1Type=>"Country",
            :adminArea3Type=>"State",
            :latLng=>{:lng=>-104.610415, :lat=>38.265425}}]}}
    @destination_temperature = '82.15'
    @destination_conditions = 'moderate rain'

    trip = RoadTrip.new(data, @destination_temperature, @destination_conditions)
    expect(trip).to be_a RoadTrip

    expect(trip.start_city).to eq("Denver, CO")
    expect(trip.end_city).to eq("Pueblo, CO")
    expect(trip.travel_time).to eq("1 hours, 45 minutes")
  end

  it "has attributes", :vcr do
    data = {:route => {
            :formattedTime=> "01:45:23",
            :locations=>[{:dragPoint=>false,
            :displayLatLng=>{:lng=>-104.984856, :lat=>39.738453},
            :adminArea4=>"Denver County",
            :adminArea5=>"Denver",
            :postalCode=>"",
            :adminArea1=>"US",
            :adminArea3=>"CO",
            :type=>"s",
            :sideOfStreet=>"N",
            :geocodeQualityCode=>"A5XAX",
            :adminArea4Type=>"County",
            :linkId=>42409351,
            :street=>"",
            :adminArea5Type=>"City",
            :geocodeQuality=>"CITY",
            :adminArea1Type=>"Country",
            :adminArea3Type=>"State",
            :latLng=>{:lng=>-104.984853, :lat=>39.738453}},
           {:dragPoint=>false,
            :displayLatLng=>{:lng=>-104.610413, :lat=>38.265427},
            :adminArea4=>"Pueblo County",
            :adminArea5=>"Pueblo",
            :postalCode=>"",
            :adminArea1=>"US",
            :adminArea3=>"CO",
            :type=>"s",
            :sideOfStreet=>"N",
            :geocodeQualityCode=>"A5XAX",
            :adminArea4Type=>"County",
            :linkId=>57644123,
            :street=>"",
            :adminArea5Type=>"City",
            :geocodeQuality=>"CITY",
            :adminArea1Type=>"Country",
            :adminArea3Type=>"State",
            :latLng=>{:lng=>-104.610415, :lat=>38.265425}}]}}
    @destination_temperature = '82.15'
    @destination_conditions = 'moderate rain'
    trip = RoadTrip.new(data, @destination_temperature, @destination_conditions)

    expect(trip).to be_a RoadTrip
    expect(trip.start_city).to eq("Denver, CO")
    expect(trip.end_city).to eq("Pueblo, CO")
    expect(trip.travel_time).to be_a String
    expect(trip.destination_temperature).to be_a Numeric
    expect(trip.destination_conditions).to be_a String
  end

  it "impossible route", :vcr do
    data = {:route => {
            :formattedTime=> "",
            :locations=>[{:dragPoint=>false,
            :displayLatLng=>{:lng=>-104.984856, :lat=>39.738453},
            :adminArea4=>"Denver County",
            :adminArea5=>"New York",
            :postalCode=>"",
            :adminArea1=>"US",
            :adminArea3=>"NY",
            :type=>"s",
            :sideOfStreet=>"N",
            :geocodeQualityCode=>"A5XAX",
            :adminArea4Type=>"County",
            :linkId=>42409351,
            :street=>"",
            :adminArea5Type=>"City",
            :geocodeQuality=>"CITY",
            :adminArea1Type=>"Country",
            :adminArea3Type=>"State",
            :latLng=>{:lng=>-104.984853, :lat=>39.738453}},
           {:dragPoint=>false,
            :displayLatLng=>{:lng=>-104.610413, :lat=>38.265427},
            :adminArea4=>"London",
            :adminArea5=>"London",
            :postalCode=>"",
            :adminArea1=>"US",
            :adminArea3=>"UK",
            :type=>"s",
            :sideOfStreet=>"N",
            :geocodeQualityCode=>"A5XAX",
            :adminArea4Type=>"County",
            :linkId=>57644123,
            :street=>"",
            :adminArea5Type=>"City",
            :geocodeQuality=>"CITY",
            :adminArea1Type=>"Country",
            :adminArea3Type=>"State",
            :latLng=>{:lng=>-104.610415, :lat=>38.265425}}]}}
    @destination_temperature = '82.15'
    @destination_conditions = 'moderate rain'
    trip = RoadTrip.new(data, @destination_temperature, @destination_conditions)

    expect(trip).to be_a RoadTrip
    # require "pry"; binding.pry
    expect(trip.start_city).to eq("New York, NY")
    expect(trip.end_city).to eq("London, UK")
    expect(trip.travel_time).to eq("0 hours, 0 minutes")
  end

  it "trip greater tha 48 hours", :vcr do
    data = {:route => {
            :formattedTime=> "80 hours, 4 minutes",
            :locations=>[{:dragPoint=>false,
            :displayLatLng=>{:lng=>-104.984856, :lat=>39.738453},
            :adminArea4=>"Denver County",
            :adminArea5=>"New York",
            :postalCode=>"",
            :adminArea1=>"US",
            :adminArea3=>"NY",
            :type=>"s",
            :sideOfStreet=>"N",
            :geocodeQualityCode=>"A5XAX",
            :adminArea4Type=>"County",
            :linkId=>42409351,
            :street=>"",
            :adminArea5Type=>"City",
            :geocodeQuality=>"CITY",
            :adminArea1Type=>"Country",
            :adminArea3Type=>"State",
            :latLng=>{:lng=>-104.984853, :lat=>39.738453}},
           {:dragPoint=>false,
            :displayLatLng=>{:lng=>-104.610413, :lat=>38.265427},
            :adminArea4=>"Pueblo County",
            :adminArea5=>"Panama city",
            :postalCode=>"",
            :adminArea1=>"US",
            :adminArea3=>"Panama",
            :type=>"s",
            :sideOfStreet=>"N",
            :geocodeQualityCode=>"A5XAX",
            :adminArea4Type=>"County",
            :linkId=>57644123,
            :street=>"",
            :adminArea5Type=>"City",
            :geocodeQuality=>"CITY",
            :adminArea1Type=>"Country",
            :adminArea3Type=>"State",
            :latLng=>{:lng=>-104.610415, :lat=>38.265425}}]}}
    @destination_temperature = '82.15'
    @destination_conditions = 'moderate rain'
    trip = RoadTrip.new(data, @destination_temperature, @destination_conditions)

    expect(trip).to be_a(RoadTrip)
# require "pry"; binding.pry
    expect(trip.destination_conditions).to eq('clear sky')
    expect(trip.destination_temperature).to eq(80.96)
    expect(trip.start_city).to eq("New York, NY")
    expect(trip.end_city).to eq("Panama city, Panama")
    expect(trip.travel_time).to eq("80 hours, 0 minutes")
  end
end
