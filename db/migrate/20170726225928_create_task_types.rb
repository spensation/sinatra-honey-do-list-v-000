class CreateTaskTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :task_types do |t|
      t.integer :task_id
      t.integer :type_id
    end
  end
end
