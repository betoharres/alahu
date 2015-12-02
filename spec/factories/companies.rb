FactoryGirl.define do
  factory :company do
    name Faker::Company.name
    subdomain Faker::Name.first_name.downcase
  end
end
