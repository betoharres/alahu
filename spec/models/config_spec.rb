require 'rails_helper'

RSpec.describe Config, type: :model do
  before :all do
    @config = FactoryGirl.create(:config)
  end

    it "requires presence of config's name" do
      @config.name = nil
      expect(@config.save).to be false
    end
end
