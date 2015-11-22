class Company < ActiveRecord::Base
  after_create :create_tenant
  after_destroy :destroy_tenant

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def destroy_tenant
    Apartment::Tenant.drop(subdomain)
  end
end
