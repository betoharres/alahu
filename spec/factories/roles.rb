FactoryGirl.define do
  factory :role do
    name Faker::Name.name

    factory :guest do
      after(:create) do |role, evaluator|
        create(:permission, resourceable_type: 'Role', role: role, ability: 1)
      end
    end
  end
end
