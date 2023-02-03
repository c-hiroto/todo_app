class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.boolean :state, default: false
      t.datetime :due_date
      t.string :priority
      t.text :memo

      t.timestamps
    end
    add_index :tasks, [:user_id, :due_date]
  end
end