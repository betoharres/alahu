class Role < ActiveRecord::Base
  has_many :user_role
  has_many :users, through: :user_role

  # Fix to resolve conflict with permissions that belongs_to Role and
  # permissions created to a specific record in roles table using polymorphism
  has_many :authorizations, class_name: 'Permission', foreign_key: 'role_id'
  has_many :permissions, as: :resourceable, dependent: :destroy

  validates_uniqueness_of :name
  validates_presence_of :name
end
