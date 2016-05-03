require 'rails_helper'

RSpec.describe Network, type: :model do
  before :all do
    @network = FactoryGirl.create(:network)
  end

  it "requires presence of network's name" do
    @network.name = nil
    expect(@network.save).to be false
  end
end
