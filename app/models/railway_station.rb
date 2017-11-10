class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :sorted, -> {
    joins(:railway_stations_routes).order("railway_stations_routes.position ASC").distinct
  }

  def update_position(route, position)
    rsr = railway_stations_routes.where(route: route).first
    rsr.update(position: position) if rsr
  end
end
