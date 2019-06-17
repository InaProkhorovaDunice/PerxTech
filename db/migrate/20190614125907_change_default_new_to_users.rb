class ChangeDefaultNewToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :new, 'registered'
  end
end
