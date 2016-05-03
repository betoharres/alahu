class Node < ActiveRecord::Base
  has_many :permissions, as: :resourceable, dependent: :destroy
  belongs_to :role
  validates_presence_of :name
end
