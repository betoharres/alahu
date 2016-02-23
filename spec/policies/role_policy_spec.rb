require 'rails_helper'

describe RolePolicy, type: :policy do

  create_not_authorized_user

  before :all do
    Apartment::Tenant.switch!(@company.subdomain)
    @record = Role.first
  end

  subject { described_class }

  permissions :show? do
    it 'permits showing role to user' do
      expect(subject).to permit(@user, @record)
    end
  end

  permissions :create? do
    it 'denies creating role if user does not have authorization' do
      expect(subject).not_to permit(@user, @record)
    end
  end

  permissions :update? do
    it 'denies creating role if user does not have authorization' do
      expect(subject).not_to permit(@user, @record)
    end
  end

  permissions :destroy? do
    it 'denies creating role if user does not have authorization' do
      expect(subject).not_to permit(@user, @record)
    end
  end
end
