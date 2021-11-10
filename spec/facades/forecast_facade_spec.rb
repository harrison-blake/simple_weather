require 'rails_helper'

RSpec.describe ForecastFacade do
  describe "happy path" do
    describe "method forecast_from_location" do
      it 'tests that the forecast facade has the correct structure' do
        location = 'Denver,CO'
        forecast = ''

        VCR.use_cassette('forecast') do
          forecast = ForecastFacade.forecast_from_location(location)
        end

        expect(forecast).to be_a(Forecast)
        expect(forecast.current_weather).to be_a(CurrentWeather)
      end
    end
  end
end
