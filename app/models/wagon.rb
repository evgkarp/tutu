class Wagon < ApplicationRecord
  belongs_to :train
  has_many :tickets

  validates :variety, presence: true
  validates :upper_seats, presence: true
  validates :lower_seats, presence: true
end
