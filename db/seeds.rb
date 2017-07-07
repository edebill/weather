# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require "csv"

puts "importing data"
Dir["data/*.csv"].each do |csv|
  puts "  from file #{csv}"
  CSV.foreach(csv, headers: :first_row) do |row|
    noaa_id = row["STATION"]
    location = "POINT(#{row["LONGITUDE"]} #{row["LATITUDE"]} #{row["ELEVATION"]})"
    station = Station.where(noaa_id: noaa_id).first || Station.create(noaa_id: noaa_id, name: row["STATION_NAME"], location: location)

    date = Date.parse(row["DATE"])
    # puts "#{date}   #{row["TMAX"]}/#{row["TMIN"]}"
    next if Day.where(station_id: station.id, date: date).first

    d = Day.create(station_id: station.id,
                   date: date,
                   high: row["TMAX"],
                   low: row["TMIN"],
                   precipitation: row["PRCP"],
                   snow: row["SNOW"])
  end
end
