class CoupeWagon < Wagon
    validates :upper_seats, :lower_seats, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end