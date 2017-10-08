FactoryGirl.define do
  factory :page do
    sequence(:name) { |n| "Page #{n}" }
    sequence(:slug) { |n| "Page-#{n}" }
    website_id 1
    association :website
  end
end
