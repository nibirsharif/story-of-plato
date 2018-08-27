class CreateProjectsUsers < ActiveRecord::Migration
  def change
    create_table :projects_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
    end
  end
end
