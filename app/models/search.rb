class Search
  def initialize(from_station_id, to_station_id)
    @from_station_id = from_station_id
    @to_station_id = to_station_id
  end

  def routes
    from_station.routes & to_station.routes if (from_station.present? && to_station.present?)
  end

  def from_station
    RailwayStation.find(@from_station_id.to_i) if @from_station_id.present?
  end

  def to_station
    RailwayStation.find(@to_station_id.to_i) if @to_station_id.present?
  end
end
