FactoryGirl.define do
  factory :role do
    name Faker::Name.name
    ability 15
  end

end
