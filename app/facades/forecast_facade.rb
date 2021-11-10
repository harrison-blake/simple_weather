class ForecastFacade
  def self.get_weather_data(location)
    lat_and_lon = GeocodeService.lon_and_lat(location)
    WeatherService.get_forecast(lat_and_lon)
  end

  def self.get_current_weather(weather_data)
    CurrentWeather.new(weather_data)
  end

  def self.forecast_from_location(weather_data)
    Forecast.new(current_weather)
  end
end
