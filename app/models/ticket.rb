class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :from_station, class_name: 'RailwayStation'
  belongs_to :to_station, class_name: 'RailwayStation'
  belongs_to :user, optional: true
  belongs_to :wagon

  validates :number, presence: true
end