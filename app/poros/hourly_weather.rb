class HourlyWeather
  attr_reader :date,
              :time,
              :temp,
              :conditions,
              :icon

  def initialize(hourly_data, offset)
    dt = hourly_data[:dt]
    @date = get_local_datetime(dt, offset).strftime("%m/%d/%Y")
    @time = get_local_datetime(dt, offset).strftime("%I:%M %p")
    @temp = hourly_data[:temp]
    @conditions = hourly_data[:weather][0][:description]
    @icon = hourly_data[:weather][0][:icon]
  end

  def get_local_datetime(datetime, offset)
    utc = Time.at(datetime).getgm
    utc.getlocal(offset)
  end
end
