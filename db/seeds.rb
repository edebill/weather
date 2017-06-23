# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require "csv"

puts "importing data for Camp Mabry"
CSV.foreach("data/Camp Mabry temperatures 1975-01-01 to 2017-06-11.csv", headers: :first_row) do |row|
  date = Date.parse(row["DATE"])
  puts "#{date}   #{row["TMAX"]}/#{row["TMIN"]}"
  d = Day.create(date: date,
                 high: row["TMAX"],
                 low: row["TMIN"],
                 precipitation: row["PRCP"],
                 snow: row["SNOW"])
end
