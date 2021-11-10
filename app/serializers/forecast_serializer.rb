class ForecastSerializer
  include JSONAPI::Serializer
  attribute :current_weather do |object|
    {
      time: object.current_weather.time,
      date: object.current_weather.date,
      sunrise: object.current_weather.sunrise,
      sunset: object.current_weather.sunset,
      temp: object.current_weather.temp,
      feels_like: object.current_weather.feels_like,
      humidity: object.current_weather.humidity,
      uvi: object.current_weather.uvi,
      visibility: object.current_weather.visibility,
      conditions: object.current_weather.conditions,
      icon: object.current_weather.icon
    }
  end
end
