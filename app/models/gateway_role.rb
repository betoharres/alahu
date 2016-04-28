class GatewayRole < ActiveRecord::Base
  belongs_to :gateway
  belongs_to :role
  has_many :permissions, as: :resourceable, dependent: :destroy
  validates_presence_of :gateway_id, :role_id
end
