class List < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  has_many :list_tasks
  has_many :tasks, through: :list_tasks
  has_many :task_types
  has_many :tasks, through: :task_types

  def find_by_slug(slugged)
    found = []
    self.all.each do |obj|
      if slugged == obj.slug
        found << obj
      end
    end
    found[0]
  end


  def slug
    strip_chars_array = self.name.downcase.scan(/[a-z0-9]+/)
    slug = strip_chars_array.join("-")
  end
  
end
