class Permission < ActiveRecord::Base
  belongs_to :role
  belongs_to :resourceable, polymorphic: true
  has_many :permissions, as: :resourceable, dependent: :destroy

  validates_presence_of :ability
end
