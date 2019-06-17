class AddNewFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :new, :boolean, default: false
  end
end
