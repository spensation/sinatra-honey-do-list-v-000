class Task < ActiveRecord::Base
  validates :name, presence: true

  has_many :task_types
  has_many :types, through: :task_types
  has_many :list_tasks
  has_many :lists, through: :list_tasks
end
