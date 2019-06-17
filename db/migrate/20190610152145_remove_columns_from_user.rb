class RemoveColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :coffee_rewards
    remove_column :users, :ticket_rewards
    remove_column :users, :cash_back
  end
end
