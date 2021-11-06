class WeatherService
  def self.get_forecast(lat_and_lon)
    response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |request|
      request.params['lat'] = lat_and_lon[0]
      request.params['lon'] = lat_and_lon[1]
      request.params['units'] = 'imperial'
      request.params['appid'] = ENV["weather_key"]
    end

    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
