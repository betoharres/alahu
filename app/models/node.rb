class Node < ActiveRecord::Base
  belongs_to :role
  validates_presence_of :name
end
