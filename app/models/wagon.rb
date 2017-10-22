class Wagon < ApplicationRecord
  belongs_to :train
  has_many :tickets

  validates :wagon_type, presence: true
  validates :upper_seats, presence: true
  validates :lower_seats, presence: true
end
