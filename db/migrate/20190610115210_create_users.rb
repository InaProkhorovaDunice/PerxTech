class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, presence: true, uniqueness: true, limit: 191
      t.string :password, presence: true, limit: 191
      t.string :first_name, limit: 191
      t.string :last_name, limit: 191
      t.datetime :dob, presence: true
      t.string :status, limit: 191, default: 'standard'
      t.integer :points, default: 0
      t.integer :coffee_rewards, default: 0
      t.integer :ticket_rewards, default: 0
      t.integer :cash_back, default: 0
      t.timestamps
    end
  end
end
