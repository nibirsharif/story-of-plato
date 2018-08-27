class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title, limit: 288
      t.string :description
      t.string :color
      t.references :user, index: true, foreign_key: true
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
