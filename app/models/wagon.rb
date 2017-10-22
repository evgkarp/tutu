class Wagon < ApplicationRecord
  belongs_to :train
  has_many :tickets

  validates :number, presence: true
end
