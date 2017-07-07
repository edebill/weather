class EnablePostgis < ActiveRecord::Migration[5.1]
  def up
    execute "CREATE EXTENSION postgis"
    execute "CREATE EXTENSION postgis_topology"
  end
end
