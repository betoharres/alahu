class Role < ActiveRecord::Base
  # has_many :users
  scope :user_role, ->(user) { where(email: user.email)}
end
