class CreateTasks < ActiveRecord::Migration[4.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.belongs_to :user, index: true
    end
  end
end
