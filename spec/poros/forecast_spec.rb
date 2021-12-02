require 'rails_helper'

RSpec.describe Forecast do
  describe 'happy path' do
    it "should build a forecast PORO based on given data" do
      weather_data = []
      lat_and_lon = [39.738453, -104.984853]

      VCR.use_cassette('weather') do
        weather_data = WeatherService.get_weather_data(lat_and_lon)
      end

      current_weather = CurrentWeather.new(weather_data)
      hourly_weather = ForecastFacade.get_hourly_weather(weather_data)

      forecast = Forecast.new(current_weather, hourly_weather)

      expect(forecast).to be_a(Forecast)
      expect(forecast.current_weather).to be_a(CurrentWeather)
    end
  end
end
