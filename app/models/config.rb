class Config < ActiveRecord::Base
  has_many :permissions, as: :resourceable, dependent: :destroy
  validates_uniqueness_of :name
  validates_presence_of :name, :content
end
