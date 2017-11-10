class Wagon < ApplicationRecord
  belongs_to :train
  has_many :tickets

  validates :train_id, uniqueness: { scope: :number }


  scope :economy, -> { where(type: 'EconomyWagon') }
  scope :coupe, -> { where(type: 'CoupeWagon') }
  scope :sedentary, -> { where(type: 'SedentaryWagon') }
  scope :sleeping, -> { where(type: 'SleepingWagon') }
  scope :ordered, -> { order(:number) }

  def self.wagons_types
    { 'EconomyWagon' => 'Плацкартный', 
      'CoupeWagon' => 'Купейный', 
      'SedentaryWagon' => 'Сидячий', 
      'SleepingWagon' => 'СВ' }
  end
end
