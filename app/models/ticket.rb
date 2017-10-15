class Ticket < ApplicationRecord
  validates :number, presence: true

  belongs_to :train, optional: true
  belongs_to :from_station, class_name: 'RailwayStation', optional: true
  belongs_to :to_station, class_name: 'RailwayStation', optional: true
  belongs_to :user, optional: true
end