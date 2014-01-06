# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_request do
    association :event, factory: :event
    association :photographer, factory: :photographer
  end
end
