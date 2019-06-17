class RemoveDateAndStatusFromTransaction < ActiveRecord::Migration
  def change
    remove_column :transactions, :date
    remove_column :transactions, :status
  end
end
