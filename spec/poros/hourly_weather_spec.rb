require 'rails_helper'

RSpec.describe HourlyWeather do
  describe 'happy path' do
    it "should build a HourlyWeather PORO" do
      data = []
      lat_and_lon = [39.738453, -104.984853]

      VCR.use_cassette('one_call_forecast') do
        data = WeatherService.get_weather_data(lat_and_lon)
      end

      hourly_weather = HourlyWeather.new(data[:hourly][0], data[:timezone_offset])

      expect(hourly_weather).to be_a(HourlyWeather)
      expect(hourly_weather.date).to be_a(String)
      expect(hourly_weather.time).to be_a(String)
      expect(hourly_weather.temp).to be_a(Float)
      expect(hourly_weather.conditions).to be_a(String)
      expect(hourly_weather.icon).to be_a(String)
    end
  end
end
