class ChangeColumnNameInRewards < ActiveRecord::Migration
  def change
    rename_column :rewards, :type, :reward_type
  end
end
