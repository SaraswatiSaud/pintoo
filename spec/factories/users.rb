FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password 'password'
  end
end
