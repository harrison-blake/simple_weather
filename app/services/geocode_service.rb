class GeocodeService
  def self.lon_and_lat(location)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address") do |request|
      request.params['key'] = ENV["geocode_key"]
      request.params['location'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
