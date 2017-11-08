class AddSeatsToWagons < ActiveRecord::Migration[5.1]
  def change
    change_table :wagons do |t|
      t.integer :seats
    end
  end
end
