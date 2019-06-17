class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.references :user, foreign_key: true
      t.string :type, limit: 191, presence: true
      t.datetime :start_date, presence: true
      t.datetime :end_date, presence: true
    end
  end
end
