class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validate :stations_count

  before_save :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}" if name.blank?
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Маршрут должен содержать минимум две станции")
    end
  end
end
