FactoryGirl.define do
  factory :permission do
    ability 15
    resourceable_type 'User'
    resourceable_id nil
    role
  end

end
