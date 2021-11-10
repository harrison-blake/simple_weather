class Forecast
  attr_reader :id,
              :current_weather

  def initialize(current_weather)
    @id = nil
    @current_weather = current_weather
  end
end
