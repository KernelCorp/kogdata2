# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name     'user'
    surname  'suruser'
    email    'user4@example.com'
    password 'password'
    conversations { [FactoryGirl.create(:conversation)] }
  end
end
