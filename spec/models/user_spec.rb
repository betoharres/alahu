require 'rails_helper'

RSpec.describe User, type: :model do

  context 'after create' do
    it 'creates a permission to user' do
      user = FactoryGirl.create(:user)
      expect(user.permission).to be_a(Permission)
    end
  end

end
