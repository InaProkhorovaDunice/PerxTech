class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.datetime :date, presence: true
      t.string :status, limit: 191, default: 'standard'
      t.integer :sum, default: 0
      t.string :country, limit: 191
      t.timestamps
    end
  end
end
