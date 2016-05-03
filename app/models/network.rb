class Network < ActiveRecord::Base
  has_many :permissions, as: :resourceable, dependent: :destroy
  has_many :nodes
  validates_presence_of :name
end
