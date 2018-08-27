class RemoveCompletedTaskLists < ActiveRecord::Migration
  def change
    remove_column :task_lists, :completed
  end
end
