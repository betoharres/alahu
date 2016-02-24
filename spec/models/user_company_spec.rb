require 'rails_helper'

RSpec.describe UserCompany, type: :model do
  before :all do
    user_company = FactoryGirl.create(:user_company)
    @company = user_company.company
    @user = user_company.user
  end

  context 'after create company' do

    it 'assigns a role to the user' do
      Apartment::Tenant.switch!(@company.subdomain)
      expect(@user).to eq(UserRole.first.user)
      Apartment::Tenant.switch!()
    end

    it 'assigns admin role to the first user' do
      Apartment::Tenant.switch!(@company.subdomain)
      expect(@user.role.name).to eq('Admin')
      expect(UserCompany.count).to eq(1)
      expect(@user.role.authorizations.first.ability).to eq(15)
      Apartment::Tenant.switch!()
    end

    it 'assigns admin role to other users' do
      user_company = FactoryGirl.create(:user_company, company: @company)
      user = user_company.user
      Apartment::Tenant.switch!(@company.subdomain)
      expect(user.role.name).to eq('Guest')
      expect(user.role.authorizations.first.ability).to eq(1)
      Apartment::Tenant.switch!()
    end

  end
end
