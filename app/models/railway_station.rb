class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :sorted, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route(route)&.update(position: position)
  end

  def position_in(route)
    station_route(route)&.position
  end

  def update_arrival_time(route, arrival_time)
    station_route(route)&.update(arrival_time: arrival_time)
  end

  def arrival_time(route)
    station_route(route)&.arrival_time&.strftime("%FT%R")
  end

  def update_departure_time(route, departure_time)
    station_route(route)&.update(departure_time: departure_time)
  end

  def departure_time(route)
    station_route(route)&.departure_time&.strftime("%FT%R")
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
