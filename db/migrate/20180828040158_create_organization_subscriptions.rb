class CreateOrganizationSubscriptions < ActiveRecord::Migration
  def change
    create_table :organization_subscriptions do |t|
      t.integer :status
      t.references :organization, index: true, foreign_key: true
      t.references :subscription_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
