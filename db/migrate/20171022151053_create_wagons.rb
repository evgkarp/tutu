class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.string :wagon_type
      t.string :upper_seats
      t.string :lower_seats

      t.timestamps
    end
  end
end
