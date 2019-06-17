class AddColumnLastYearPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_year_points, :integer, default: 0
  end
end
