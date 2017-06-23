class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.date :date
      t.decimal :precipitation
      t.decimal :snow
      t.integer :high
      t.integer :low

      t.timestamps
    end
  end
end
