class UserCompany < ActiveRecord::Base
  self.table_name = 'users_companies'
  belongs_to :user
  belongs_to :company
  has_many :permission, as: :resourceable, dependent: :destroy

  after_create :create_admin_role

  def create_admin_role
    Apartment::Tenant.switch!(company.subdomain)
    UserRole.create! user: company.users.first, role: Role.create!(name: 'Admin')
    role = Role.find_by(name: 'Admin')
    Resource.all.each do |resource|
      Permission.create! ability: 15, resourceable_type: resource.name, role: role
    end
    Apartment::Tenant.switch!()
  end
end
