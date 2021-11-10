class CurrentWeather
  attr_reader :time,
              :date,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :temp,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    dt = data[:current][:dt]
    sunrise = data[:current][:sunrise]
    sunset = data[:current][:sunset]
    offset = data[:timezone_offset]
    @time = get_local_datetime(dt, offset).strftime("%I:%M %p")
    @date = get_local_datetime(dt, offset).strftime("%m/%d/%Y")
    @sunrise = get_local_datetime(sunrise, offset).strftime("%I:%M %p")
    @sunset = get_local_datetime(sunset, offset).strftime("%I:%M %p")
    @temp = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @temp = data[:current][:temp]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
  end

  def get_local_datetime(datetime, offset)
    utc = Time.at(datetime).getgm
    dt = utc.getlocal(offset)
  end
end
