class UpdateComparativeDaysToVersion3 < ActiveRecord::Migration[5.0]
  def change
    update_view :comparative_days, version: 3, revert_to_version: 2
  end
end
