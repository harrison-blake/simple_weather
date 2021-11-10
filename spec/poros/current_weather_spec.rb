require 'rails_helper'

RSpec.describe CurrentWeather do
  describe 'happy path' do
    it "should build a CurrentWeather PORO based on given data" do
      data = []
      lat_and_lon = [39.738453, -104.984853]

      VCR.use_cassette('one_call_forecast') do
        data = WeatherService.get_weather_data(lat_and_lon)
      end

      current_weather = CurrentWeather.new(data)

      expect(current_weather).to be_a(CurrentWeather)
      expect(current_weather.time).to be_a(String)
      expect(current_weather.date).to be_a(String)
      expect(current_weather.sunrise).to be_a(String)
      expect(current_weather.sunset).to be_a(String)
      expect(current_weather.feels_like).to be_a(Float)
      expect(current_weather.temp).to be_a(Float)
      expect(current_weather.temp).to be_a(Float)
      expect(current_weather.humidity).to be_a(Integer)
      expect(current_weather.uvi).to be_a(Integer || Float)
      expect(current_weather.visibility).to be_a(Integer)
      expect(current_weather.conditions).to be_a(String)
      expect(current_weather.icon).to be_a(String)
      expect(current_weather.temp).to be_a(Float)
    end

    it "should return the correct time with given timezone offset" do
      data = []
        lat_and_lon = [39.2904, -76.6122]

      VCR.use_cassette('baltimore_timezone_check') do
        data = WeatherService.get_weather_data(lat_and_lon)
      end

      current_weather = CurrentWeather.new(data)
      expect(current_weather.time).to eq("01:22 AM")
    end
  end
end
