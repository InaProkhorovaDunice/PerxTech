class AddColumnMonthPointsToUser < ActiveRecord::Migration
  def change
    add_column :users, :month_points, :integer, default: 0
  end
end
