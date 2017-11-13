class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :sorted, -> {
    joins(:railway_stations_routes).order("railway_stations_routes.position ASC").distinct
  }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_arrival_time(route, arrival_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time) if station_route
  end

  def set_arrival_time(route)
    station_route(route).try(:arrival_time).try { strftime("%FT%R") }
  end

  def update_departure_time(route, departure_time)
    station_route = station_route(route)
    station_route.update(departure_time: departure_time) if station_route
  end

  def set_departure_time(route)
    station_route(route).try(:departure_time).try { strftime("%FT%R") }
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
