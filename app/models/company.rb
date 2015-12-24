class Company < ActiveRecord::Base
  has_many :users_companies, dependent: :destroy
  has_many :users, through: :users_companies

  after_create :create_tenant, :delete_constraint
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
    ActiveRecord::Base.connection.execute("ALTER TABLE #{subdomain}.user_roles DROP CONSTRAINT #{USER_ROLE_CONSTRAINT};")
  end
end
