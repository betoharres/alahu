require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'after create' do
    it 'removes user_roles constraint from tenant' do
      user_company = FactoryGirl.create(:user_company)
      company = user_company.company
      user = user_company.user
      Apartment::Tenant.switch!(company.subdomain)
      expect(user).to eq(UserRole.first.user)
      Apartment::Tenant.switch!()
    end
  end
end
