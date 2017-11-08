class EconomyWagon < Wagon
  validates :upper_seats, :lower_seats, :side_upper_seats, :side_lower_seats, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end