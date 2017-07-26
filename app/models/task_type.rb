class TaskType < ActiveRecord::Base
  belongs_to :type
  belongs_to :task
end
