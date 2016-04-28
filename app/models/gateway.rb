class Gateway < ActiveRecord::Base
  has_one :gateway_role, dependent: :destroy
  has_one :role, through: :gateway_role
  has_one :permission, as: :resourceable, dependent: :destroy

  # Include default devise modules.
   devise :database_authenticatable,
          :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  after_create :link_gateway_to_role

  def link_gateway_to_role
    gateway_role = Role.find_by(name: 'Gateway')
    GatewayRole.create(role: gateway_role, gateway: self)
  end

end
