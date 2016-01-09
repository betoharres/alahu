require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    User.delete_all
  end

  context 'after create' do
    it 'create permission to user' do
      user = FactoryGirl.create(:user)
    end
  end
end
