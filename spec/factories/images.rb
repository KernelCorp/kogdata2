# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    association :photographer, factory: :photographer
    attachment { fixture_file_upload(Rails.root.join('spec', 'images', 'test.png'), 'image/png') }
  end
end
