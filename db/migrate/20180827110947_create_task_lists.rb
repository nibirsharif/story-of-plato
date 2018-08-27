class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.integer :completed
      t.string :color
      t.references :card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
