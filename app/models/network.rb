class Network < ActiveRecord::Base
  has_many :nodes
  validates_presence_of :name
end
