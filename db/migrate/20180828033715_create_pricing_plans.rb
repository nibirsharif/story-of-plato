class CreatePricingPlans < ActiveRecord::Migration
  def change
    create_table :pricing_plans do |t|
      t.string :name
      t.string :currency, default: "USD"
      t.integer :monthly_price
      t.integer :annual_price
      t.integer :additional_charge

      t.timestamps null: false
    end
  end
end
