class Role < ActiveRecord::Base
  # has_many :users
  scope :user_role, ->(user) { UserRole.where(email: user.email).first.role}
end
