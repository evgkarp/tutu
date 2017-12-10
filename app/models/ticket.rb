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

  after_create :send_notification

  after_destroy :send_notification_delete

  def route_name
    "#{from_station.title} - #{to_station.title}"
  end

  private

  def set_number
    self.number = train.tickets.maximum(:number).to_i + 1
  end

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_delete
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
