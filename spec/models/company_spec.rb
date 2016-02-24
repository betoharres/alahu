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
      }.to change(Role, :count).by(2)
      Apartment::Tenant.switch!()
    end

    it 'sets subdomain to downcase' do
      @company.subdomain = 'TEST'
      @company.save
      expect(@company.subdomain).not_to match(/[A-Z]+/)

    end

    it 'requires presence of name' do
      @company.name = nil
      expect {
        @company.save
      }.not_to change{Company.count}
    end

    it 'requires presence of subdomain' do
      @company.subdomain = nil
      expect {
        @company.save
      }.not_to change{Company.count}
    end

  end

    it 'drops the tenant' do
      @company.destroy!
      expect(Apartment.tenant_names).not_to include(@company.subdomain)
    end
end
