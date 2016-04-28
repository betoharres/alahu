class Company < ActiveRecord::Base
  has_many :users_companies, dependent: :destroy
  has_many :users, through: :users_companies

  before_save :subdomain_to_downcase
  after_create :create_tenant, :delete_constraint, :create_roles
  after_destroy :destroy_tenant

  validates_presence_of :name, :subdomain

  # $ psql database_name
  # \d user_roles
  USER_ROLE_CONSTRAINT = 'fk_rails_318345354e'

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def destroy_tenant
    Apartment::Tenant.drop(subdomain)
  end

  def delete_constraint
    ActiveRecord::Base.connection.execute(
      "ALTER TABLE #{subdomain}.user_roles DROP CONSTRAINT #{USER_ROLE_CONSTRAINT};"
    )
  end

  def create_roles
    Apartment::Tenant.switch!(subdomain)

    admin = Role.create!(name: 'Admin')

    Resource.all.each do |resource|
      Permission.create! ability: 15, resourceable_type: resource.name,
                         role: admin
    end

    guest = Role.create!(name: 'Guest')

    Resource.all.each do |resource|
      Permission.create! ability: 1, resourceable_type: resource.name,
                         role: guest
    end

    gateway = Role.create!(name: 'Gateway')
    gateway_create_whitelist = ['LampStat', 'GatewayStat']

    Resource.all.each do |resource|
      if gateway_create_whitelist.include?(resource.name)
        Permission.create! ability: 3, resourceable_type: resource.name,
                           role: gateway
      elsif resource.name == 'Task'
        # can UPDATE
        Permission.create! ability: 7, resourceable_type: resource.name,
                           role: gateway
      else
        Permission.create! ability: 1, resourceable_type: resource.name,
                           role: gateway
      end
    end

    Apartment::Tenant.switch!()
  end

  def subdomain_to_downcase
    self.subdomain = self.subdomain.downcase
  end

end
