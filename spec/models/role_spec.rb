require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'returns role and user' do
    user = FactoryGirl.create(:user, email: 'a@a.com')
    user_role = FactoryGirl.create(:user_role, email: user.email)
    role = Role.user_role(user)
    expect(role).to eq(user_role.role)
  end
end
