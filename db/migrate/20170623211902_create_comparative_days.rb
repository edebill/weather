class CreateComparativeDays < ActiveRecord::Migration[5.0]
  def change
    create_view :comparative_days
  end
end
