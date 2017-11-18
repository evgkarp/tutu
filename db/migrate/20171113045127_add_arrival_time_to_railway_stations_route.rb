class AddArrivalTimeToRailwayStationsRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :arrival_time, :datetime
  end
end
