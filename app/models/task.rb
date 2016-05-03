class Task < ActiveRecord::Base
  belongs_to :node
  belongs_to :attachable, polymorphic: true
  validates_presence_of :execute_at
end
