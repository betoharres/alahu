require 'rails_helper'

RSpec.describe Firmware, type: :model do
  before :all do
    @firmware = FactoryGirl.create(:firmware)
  end

  it "requires presence of firmware's path" do
    @firmware.path = nil
    expect(@firmware.save).to be false
  end
end
