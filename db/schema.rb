# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170623211902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.decimal "precipitation"
    t.decimal "snow"
    t.integer "high"
    t.integer "low"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_view "comparative_days",  sql_definition: <<-SQL
      SELECT days.date,
      to_char((days.date)::timestamp with time zone, 'MMDD'::text) AS month_day,
      days.high,
      round(avg(days.high) OVER (PARTITION BY (to_char((days.date)::timestamp with time zone, 'MMDD'::text)))) AS avg_high,
      round((min(days.high) OVER (PARTITION BY (to_char((days.date)::timestamp with time zone, 'MMDD'::text))))::double precision) AS min_high,
      round((max(days.high) OVER (PARTITION BY (to_char((days.date)::timestamp with time zone, 'MMDD'::text))))::double precision) AS max_high,
      round(avg(days.low) OVER (PARTITION BY (to_char((days.date)::timestamp with time zone, 'MMDD'::text)))) AS avg_low,
      round((min(days.low) OVER (PARTITION BY (to_char((days.date)::timestamp with time zone, 'MMDD'::text))))::double precision) AS min_low,
      round((max(days.low) OVER (PARTITION BY (to_char((days.date)::timestamp with time zone, 'MMDD'::text))))::double precision) AS max_low,
      days.low,
      days.precipitation,
      days.snow
     FROM days;
  SQL

end
