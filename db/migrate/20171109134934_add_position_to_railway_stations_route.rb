class AddPositionToRailwayStationsRoute < ActiveRecord::Migration[5.1]
  def change
    change_table :railway_stations_routes do |t|
      t.integer :position
    end
  end
end
