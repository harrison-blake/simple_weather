class ForecastFacade
  def self.get_weather_data(location)
    geocode_data = GeocodeService.lon_and_lat(location)
    lat = geocode_data[:results][0][:locations][0][:latLng][:lat]
    lon = geocode_data[:results][0][:locations][0][:latLng][:lng]

    WeatherService.get_weather_data([lat, lon])
  end

  def self.get_current_weather(weather_data)
    CurrentWeather.new(weather_data)
  end

  def self.get_hourly_weather(weather_data)
    hourly_weather = []

    weather_data[:hourly].each_with_index do |hour, i|
      hourly_weather << HourlyWeather.new(hour, weather_data[:timezone_offset]) if i < 8
    end

    hourly_weather
  end

  def self.forecast_from_location(location)
    weather_data = get_weather_data(location)
    current_weather = get_current_weather(weather_data)
    hourly_weather = get_hourly_weather(weather_data)

    Forecast.new(current_weather, hourly_weather)
  end
end
