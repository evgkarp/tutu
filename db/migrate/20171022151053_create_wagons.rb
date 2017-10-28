class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.string :variety
      t.integer :upper_seats
      t.integer :lower_seats

      t.timestamps
    end
  end
end
