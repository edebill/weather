class AddStationIdToDays < ActiveRecord::Migration[5.1]
  def change
    add_column :days, :station_id, :int, index: true
  end
end
