class UserCompany < ActiveRecord::Base
  self.table_name = 'users_companies'
  belongs_to :user
  belongs_to :company
  has_many :permission, as: :resourceable, dependent: :destroy

  after_create :link_user_to_role

  def link_user_to_role
    Apartment::Tenant.switch!(company.subdomain)

    if UserCompany.count(user: user, company: company) > 1
      guest = Role.find_by(name: 'Guest')
      UserRole.create! user: user, role: guest
    else
      admin = Role.find_by(name: 'Admin')
      UserRole.create! user: user, role: admin
    end

    Apartment::Tenant.switch!()
  end
end
