class Company < ActiveRecord::Base
  after_create :create_tenant
  after_destroy :destroy_tenant

  validates_presence_of :name, :subdomain

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def destroy_tenant
    Apartment::Tenant.drop(subdomain)
  end
end
