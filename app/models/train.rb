class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def seats_count(wagons_type, seats_type)
    wagons.where(type: wagons_type).sum(seats_type)
  end

  def uniq_wagons_types
    uniq_wagons_types = wagons.map { |wagon| wagon.type }
    uniq_wagons_types.uniq
  end

  def ordered_wagons
    if head_ordered
      wagons.order(number: :asc)
    else
      wagons.order(number: :desc)
    end
  end
end
