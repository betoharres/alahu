class Task < ActiveRecord::Base
  belongs_to :node
  belongs_to :attachable, polymorphic: true
  has_many :permissions, as: :resourceable, dependent: :destroy
  validates_presence_of :execute_at
end
