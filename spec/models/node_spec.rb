require 'rails_helper'

RSpec.describe Node, type: :model do
  before :all do
    @node = FactoryGirl.create(:node)
  end

  it "requires presence of node's name" do
    @node.name = nil
    expect(@node.save).to be false
  end
end
