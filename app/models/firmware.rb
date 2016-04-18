class Firmware < ActiveRecord::Base
  validates_presence_of :path
end
