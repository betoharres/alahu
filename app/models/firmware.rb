class Firmware < ActiveRecord::Base
  has_many :permissions, as: :resourceable, dependent: :destroy
  validates_presence_of :path
end
