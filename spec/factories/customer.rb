# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name     'customer'
    surname  'surcustomer'
    sequence(:email) {|n| "custemail#{n}@example.com" }
    type 'Customer'
    password 'password'
    conversations { [] }
  end
end
