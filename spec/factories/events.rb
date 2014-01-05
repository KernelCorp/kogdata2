# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    city "Moscow"
    date Date.today
    time "11:00"
    event_type nil
    budget 1
    customer nil
  end
end
