class AddDateToTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :due_date, :datetime
    add_column :tasks, :due_date, :date
  end
end
