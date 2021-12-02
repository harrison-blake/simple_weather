class Forecast
  attr_reader :id,
              :current_weather,
              :hourly_weather

  def initialize(current_weather, hourly_weather)
    @id = nil
    @current_weather = current_weather
    @hourly_weather = hourly_weather
  end
end
