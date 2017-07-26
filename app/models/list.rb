class List < ActiveRecord::Base
  validates :name, presence: true
  
  belongs_to :user
  has_many :list_tasks
  has_many :tasks, through: :list_tasks
  has_many :task_types
  has_many :tasks, through: :task_types

end
