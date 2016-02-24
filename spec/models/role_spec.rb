require 'rails_helper'

RSpec.describe Role, type: :model do
  before :all do
    @role = FactoryGirl.create(:role)
  end

    it "requires presence of role's name" do
      @role.name = nil
      expect {
        @role.save
      }.not_to change{Role.count}
    end
end
