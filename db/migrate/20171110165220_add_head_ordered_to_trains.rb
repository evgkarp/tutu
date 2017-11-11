class AddHeadOrderedToTrains < ActiveRecord::Migration[5.1]
  def change
    change_table :trains do |t|
      t.boolean :head_ordered, default: true
    end
  end
end
