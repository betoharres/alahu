require 'rails_helper'

describe PermissionPolicy, type: :policy do

  create_guest_user

  before :all do
    Apartment::Tenant.switch!(@company.subdomain)
    @record = Permission.first
  end

  subject { described_class }

  permissions :show? do
    it 'permits showing permission to user' do
      expect(subject).to permit(@user, @record)
    end
  end

  permissions :create? do
    it 'denies creating permission if user does not have authorization' do
      expect(subject).not_to permit(@user, @record)
    end
  end

  permissions :update? do
    it 'denies updating permission if user does not have authorization' do
      expect(subject).not_to permit(@user, @record)
    end
  end

  permissions :destroy? do
    it 'denies destroying permission if user does not have authorization' do
      expect(subject).not_to permit(@user, @record)
    end
  end
end
