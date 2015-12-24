FactoryGirl.define do
  factory :permission do
    user_id = before(:create) do
      FactoryGirl.create(:user).id
    end
    ability 15
    resourceable_type 'User'
    resourceable_id user_id
    role
  end

end
