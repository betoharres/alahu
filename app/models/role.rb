class Role < ActiveRecord::Base
  has_many :user_role
  has_many :users, through: :user_role
end
