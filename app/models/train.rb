class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def seats_count(wagons_variety, seats_level)
    self.wagons.where(variety: wagons_variety).sum(seats_level)
  end

  def wagons_count(wagons_variety)
    self.wagons.where(variety: wagons_variety).count
  end
end
