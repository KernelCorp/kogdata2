# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    city "Moscow"
    date DateTime.now
    event_type 'Type1'
    budget 1
    association :customer, factory: :customer
  end
end
