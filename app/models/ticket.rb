class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :from_station, class_name: 'RailwayStation'
  belongs_to :to_station, class_name: 'RailwayStation'
  belongs_to :user, optional: true
  belongs_to :wagon

  validates :number, :full_name, :passport_number, presence: true
  validates :passport_number, numericality: { only_integer: true },
                              length: { is: 10 }

  before_validation :set_number, on: :create

  private

  def set_number
    self.number = train.tickets.maximum(:number).to_i + 1
  end
end
