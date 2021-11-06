class GeocodeService
  def self.lon_and_lat(location)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address") do |request|
      request.params['key'] = "m8D4LeIBrdHO43J6djxX7p2aH7WWgCy2"
      request.params['location'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
