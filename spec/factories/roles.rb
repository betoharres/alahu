FactoryGirl.define do
  factory :role do
    name Faker::Name.name
    # after(:create) do |role|
    #   create(:user_role, role: role)
    # end
  end

end
