class Wagon < ApplicationRecord
  belongs_to :train
  has_many :tickets

  validates :variety, :upper_seats, :lower_seats, presence: true
  validates :variety, inclusion: { in: %w(Купейный Плацкартный) }
  validates :upper_seats, :lower_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
