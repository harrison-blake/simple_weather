class Forecast
  attr_reader :current_weather
  
  def initialize(current_weather)
    @current_weather = current_weather
  end
end
