class TicketFromToStation < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :tickets, :from_station
    add_belongs_to :tickets, :to_station
  end
end
