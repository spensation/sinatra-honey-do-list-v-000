class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  has_secure_password
  
  has_many :lists
  has_many :tasks, through: :lists
  has_many :types, through: :tasks
end
