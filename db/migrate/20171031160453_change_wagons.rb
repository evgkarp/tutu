class ChangeWagons < ActiveRecord::Migration[5.1]
  def change
    change_table :wagons do |t|
      t.remove :variety
      t.integer :number
      t.integer :side_upper_seats
      t.integer :side_lower_seats
      t.string :type
    end
  end
end
