FactoryGirl.define do
  factory :role do
    name Faker::Name.name
    ability rand(1..15)
  end

end
