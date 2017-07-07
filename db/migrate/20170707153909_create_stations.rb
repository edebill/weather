class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :noaa_id
      t.string :name
      t.st_point :location, geographic: true, has_z: true
      t.timestamps
    end
  end
end
