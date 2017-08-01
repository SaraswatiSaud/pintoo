FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "admin#{n}@example.com" }
     master
    password 'password'
  end
end
