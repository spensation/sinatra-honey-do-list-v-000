class ListTask < ActiveRecord::Base
  belongs_to :list
  belongs_to :task
end
