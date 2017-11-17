class Search
  def self.start(from_station_id, to_station_id)
    found_routes = []
    Route.find_each do |route|
      if route.railway_station_ids.include?(from_station_id.to_i) &&
         route.railway_station_ids.include?(to_station_id.to_i)
        found_routes << route if from_station(from_station_id).position_in(route).to_i <
                                 to_station(to_station_id).position_in(route).to_i
      end
    end
    found_routes
  end

  def self.from_station(from_station_id)
    RailwayStation.find(from_station_id.to_i) unless from_station_id.nil?
  end

  def self.to_station(to_station_id)
    RailwayStation.find(to_station_id.to_i) unless to_station_id.nil?
  end
end
