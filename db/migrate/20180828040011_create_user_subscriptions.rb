class CreateUserSubscriptions < ActiveRecord::Migration
  def change
    create_table :user_subscriptions do |t|
      t.integer :status
      t.references :user, index: true, foreign_key: true
      t.references :subscription_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
