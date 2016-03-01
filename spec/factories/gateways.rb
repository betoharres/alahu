FactoryGirl.define do
  factory :gateway do
    sequence(:email) { |n| "gateway#{n}@example.com" }
    password 12345678
    password_confirmation 12345678
    authorized true
  end
end
