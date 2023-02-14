class RenameStateColumnToTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :state, :is_done
  end
end
