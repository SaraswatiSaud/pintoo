# frozen_string_literal: true

FactoryGirl.define do
  factory :menu do
    sequence(:name) { |n| "Menu #{n}" }
    sequence(:slug) { |n| "Menu-#{n}" }
    website_id 1
    association :website
  end
end
