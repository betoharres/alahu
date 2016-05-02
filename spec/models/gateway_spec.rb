require 'rails_helper'

RSpec.describe Gateway, type: :model do

  before :all do
    company = FactoryGirl.create(:company)
    Apartment::Tenant.switch!(company.subdomain)
    @gateway = FactoryGirl.create(:gateway)
  end

  after :all do
    Apartment::Tenant.switch!()
  end

  it "requires presence of gateway's email" do
    @gateway.email = nil
    expect(@gateway.save).to be false
  end

  it 'assigns a Gateway Role name to @gateway' do
    expect(@gateway.role.name).to eq('Gateway')
  end

end
