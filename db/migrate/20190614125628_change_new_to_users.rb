class ChangeNewToUsers < ActiveRecord::Migration
  def change
    change_column :users, :new, :string
  end
end
