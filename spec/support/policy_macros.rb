module PolicyMacros
  def create_guest_user
    before :all do
      user_company = FactoryGirl.create(:user_company)
      @company = user_company.company
      Apartment::Tenant.switch!(user_company.company.subdomain)
      role = Role.find_by(name: 'Guest')
      @user = FactoryGirl.create(:user_role, role: role).user
      Apartment::Tenant.switch!()
    end
  end
end
