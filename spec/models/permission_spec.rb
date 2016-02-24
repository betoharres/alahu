require 'rails_helper'

RSpec.describe Permission, type: :model do

  before :all do
    @permission = FactoryGirl.create(:permission)
  end

  it 'belongs to a Role' do
    expect(@permission.role).to be_a Role
  end

  it 'must have ability filled' do
    expect(@permission.ability).to be_a Integer
  end

  it "deletes record and it's custom permissions" do
    role = FactoryGirl
      .create(:role, name: 'CustomRole')
    FactoryGirl.create(:permission,
                      role: role,
                      resourceable_id: role.id,
                      resourceable_type: role.class)
    destroyed_role = role.destroy!
    expect(destroyed_role.permissions).to be_empty
  end

end
