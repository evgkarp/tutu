class Wagon < ApplicationRecord
  WAGONS_TYPES =
    { 'EconomyWagon' => 'Плацкартный',
      'CoupeWagon' => 'Купейный',
      'SedentaryWagon' => 'Сидячий',
      'SleepingWagon' => 'СВ' }.freeze

  belongs_to :train
  has_many :tickets

  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number, on: :create

  scope :economy, -> { where(type: 'EconomyWagon') }
  scope :coupe, -> { where(type: 'CoupeWagon') }
  scope :sedentary, -> { where(type: 'SedentaryWagon') }
  scope :sleeping, -> { where(type: 'SleepingWagon') }
  scope :ordered, -> { order(:number) }

  def self.seats_types
    { upper_seats: 'Верхние места',
      lower_seats: 'Нижние места',
      side_upper_seats: 'Верхние боковые места',
      side_lower_seats: 'Нижние боковые места',
      seats: 'Сидячие места' }
  end

  private

  def set_number
    self.number = train.wagons.maximum(:number).to_i + 1
  end
end
