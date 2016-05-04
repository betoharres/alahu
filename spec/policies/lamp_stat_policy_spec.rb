require 'rails_helper'

describe LampStatPolicy, type: :policy do

  create_guest_user

  before :all do
    Apartment::Tenant.switch!(@company.subdomain)
    @record = FactoryGirl.create(:lamp_stat)
  end

  subject { described_class }

  permissions :show? do
    it 'permits showing LampStat to user' do
      expect(subject).to permit(@user, @record)
    end
  end

  permissions :create? do
    it 'denies creating LampStat if user does not have authorization' do
      expect(subject).not_to permit(@user, @record)
    end
  end

  permissions :update? do
    it 'denies creating LampStat if user does not have authorization' do
      expect(subject).not_to permit(@user, @record)
    end
  end

  permissions :destroy? do
    it 'denies creating LampStat if user does not have authorization' do
      expect(subject).not_to permit(@user, @record)
    end
  end
end
