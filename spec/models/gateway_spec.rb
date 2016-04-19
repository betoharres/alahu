require 'rails_helper'

RSpec.describe Gateway, type: :model do

  before :all do
    @gateway = FactoryGirl.create(:gateway)
  end

  it "requires presence of gateway's email" do
    @gateway.email = nil
    expect(@gateway.save).to be false
  end

end
