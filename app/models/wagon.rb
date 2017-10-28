class Wagon < ApplicationRecord
  belongs_to :train
  has_many :tickets

  validates :variety, presence: true, inclusion: { in: %w(Купейный Плацкартный) }
  validates :upper_seats, :lower_seats, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
