class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.integer :plan_type
      t.integer :subscription_type
      t.integer :monthly_cap
      t.references :pricing_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
