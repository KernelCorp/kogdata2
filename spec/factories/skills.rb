# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill do
    sequence(:name) { |n| "skill_#{n}" }
  end
end
