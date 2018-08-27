class CreateCardReferences < ActiveRecord::Migration
  def change
    create_table :card_references do |t|
      t.integer :card_referrer_id
      t.integer :card_referent_id

      t.timestamps null: false
    end
  end
end
