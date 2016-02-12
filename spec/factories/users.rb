FactoryGirl.define do
  factory :user do
    email { "#{rand(1..10000).to_s}@test.com"}
    password 12345678
    password_confirmation 12345678
  end
end
