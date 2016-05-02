require 'rails_helper'

RSpec.describe Company, type: :model do

  before :each do
    @company = FactoryGirl.create(:company)
  end

  context 'after create' do

    it 'creates a tenant' do
      expect(Apartment.tenant_names).to include(@company.subdomain)
    end

    it 'create default roles' do
      expect {
        company = FactoryGirl.create(
          :company, subdomain: 'teste'
        )
        Apartment::Tenant.switch!(
          company.subdomain
        )
      }.to change(Role, :count).by(3)
      Apartment::Tenant.switch!()
    end

    it 'sets subdomain to downcase' do
      @company.subdomain = 'TEST'
      @company.save
      expect(@company.subdomain).not_to match(/[A-Z]+/)
    end

    it 'requires presence of name' do
      @company.name = nil
      expect(@company.save).to be false
    end

    it 'requires presence of subdomain' do
      @company.subdomain = nil
      expect(@company.save).to be false
    end

    it 'creates permissions to Admin Role' do
      Apartment::Tenant.switch!(@company.subdomain)
      permissions = Role.find_by(name: 'Admin').authorizations
      expect(permissions.count).to be > 0
    end

    it 'creates permissions to Guest Role' do
      Apartment::Tenant.switch!(@company.subdomain)
      permissions = Role.find_by(name: 'Guest').authorizations
      expect(permissions.count).to be > 0
    end

    it 'creates permissions to Gateway Role' do
      Apartment::Tenant.switch!(@company.subdomain)
      permissions = Role.find_by(name: 'Gateway').authorizations
      expect(permissions.count).to be > 0
    end

    it 'Gateway Role has abilities lower than 7' do
      Apartment::Tenant.switch!(@company.subdomain)
      permissions = Role.find_by(name: 'Gateway').authorizations
      ability_check = permissions.pluck(:ability).bsearch{|ability| ability > 7 }
      expect(ability_check.nil?).to eq(true)
    end

    it 'Admin role has abilities equal 15' do
      Apartment::Tenant.switch!(@company.subdomain)
      permissions = Role.find_by(name: 'Admin').authorizations
      ability_check = permissions.pluck(:ability).bsearch{|ability| ability < 15 }
      expect(ability_check.nil?).to eq(true)
    end

    it 'Guest role has abilities equal 1' do
      Apartment::Tenant.switch!(@company.subdomain)
      permissions = Role.find_by(name: 'Guest').authorizations
      ability_check = permissions.pluck(:ability).bsearch{|ability| ability > 1 }
      expect(ability_check.nil?).to eq(true)
    end

  end

    it 'drops the tenant' do
      @company.destroy!
      expect(Apartment.tenant_names).not_to include(@company.subdomain)
    end
end
