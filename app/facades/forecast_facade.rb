class ForecastFacade
  def self.get_weather_data(location)
    geocode_data = GeocodeService.lon_and_lat(location)
    lat = geocode_data[:results][0][:locations][0][:latLng][:lat]
    lon = geocode_data[:results][0][:locations][0][:latLng][:lng]



    WeatherService.get_forecast([lat, lon])
  end

  def self.get_current_weather(weather_data)
    CurrentWeather.new(weather_data)
  end

  def self.forecast_from_location(location)
    weather_data = get_weather_data(location)
    current_weather = get_current_weather(weather_data)

    Forecast.new(current_weather)
  end
end
