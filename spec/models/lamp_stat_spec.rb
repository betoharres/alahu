require 'rails_helper'

RSpec.describe LampStat, type: :model do

  before :all do
    @lamp_stat = FactoryGirl.create(:lamp_stat)
  end

  it "requires presence of lamp_stat's serial_num" do
    @lamp_stat.serial_number = nil
    expect(@lamp_stat.save).to be false
  end
end
