class LampStat < ActiveRecord::Base
  has_many :permissions, as: :resourceable, dependent: :destroy
  validates_presence_of :serial_number
end
