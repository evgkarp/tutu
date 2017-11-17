class ChangeTickets < ActiveRecord::Migration[5.1]
  def change
    change_table :tickets do |t|
      t.string :full_name
      t.string :passport_number
    end
  end
end
