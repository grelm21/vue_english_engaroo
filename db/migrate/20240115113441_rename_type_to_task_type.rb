class RenameTypeToTaskType < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :type, :task_type
  end
end
