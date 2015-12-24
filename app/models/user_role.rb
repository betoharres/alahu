class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  has_many :permissions, as: :resourceable, dependent: :destroy
end
