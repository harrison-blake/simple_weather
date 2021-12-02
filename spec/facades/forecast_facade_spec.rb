require 'rails_helper'

RSpec.describe ForecastFacade do
  describe "happy path" do
    before :each do
      location = 'Denver,CO'
      @forecast = ''

      VCR.use_cassette('forecast') do
        @forecast = ForecastFacade.forecast_from_location(location)
      end
    end
    it 'should build a forecast object' do
      expect(@forecast).to be_a(Forecast)
    end

    it "forecast object should store correct data" do

      expect(@forecast.current_weather).to be_a(CurrentWeather)
      expect(@forecast.hourly_weather[0]).to be_a(HourlyWeather)
      expect(@forecast.hourly_weather.length).to eq(8)
    end
  end
end
