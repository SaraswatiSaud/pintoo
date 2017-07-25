FactoryGirl.define do
  factory :website do
    sequence(:name) { |n| "Website #{n}" }
    sequence(:subdomain) { |n| "website #{n}" }
    user_id 1
    association :user
  end
end
