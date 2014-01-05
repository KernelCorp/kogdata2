# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photographer do
    name     'photographer'
    surname  'surphotographer'
    sequence(:email) {|n| "email#{n}@example.com" }
    type 'Photographer'
    password 'password'
    conversations { [] }
  end
end
