class Permission < ActiveRecord::Base
  belongs_to :resourceable, polymorphic: true
  belongs_to :role
end
