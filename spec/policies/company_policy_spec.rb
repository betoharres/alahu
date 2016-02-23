require 'rails_helper'

describe CompanyPolicy, type: :policy do

  before :all do
    user_company = FactoryGirl.create(:user_company)
    @company = user_company.company
    @user = user_company.user
    Apartment::Tenant.switch!(@company.subdomain)
    @record = @company
  end

  subject { described_class }

  permissions :show? do
    it 'permits showing permission to user' do
      expect(subject).to permit(@user, @record)
    end
  end

  permissions :update? do
    it 'denies updating permission if user does not have authorization' do
      expect(subject).to permit(@user, @record)
    end
  end

  permissions :destroy? do
    it 'denies destroying permission if user does not have authorization' do
      expect(subject).to permit(@user, @record)
    end
  end
end
