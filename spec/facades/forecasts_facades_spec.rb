RSpec.describe ForecastFacade do
  describe "happy path" do
    describe "method forecast_from_location" do
      it 'tests the structure of data returned' do
        location = 'Denver,CO'
        forecast = ''

        VCR.use_cassette('forecast') do
          forecast = ForecastFacade.forcast_from_location(location)
        end

        expect(forecast).to be_a(Forecast)
      end
    end
  end
end
